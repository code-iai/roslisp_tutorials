;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Software License Agreement (BSD License)
;;
;; Copyright (c) 2008, Willow Garage, Inc.
;; All rights reserved.
;;
;; Redistribution and use in source and binary forms, with
;; or without modification, are permitted provided that the
;; following conditions are met:
;;
;;  * Redistributions of source code must retain the above
;;    copyright notice, this list of conditions and the
;;    following disclaimer.
;;  * Redistributions in binary form must reproduce the
;;    above copyright notice, this list of conditions and
;;    the following disclaimer in the documentation and/or
;;    other materials provided with the distribution.
;;  * Neither the name of Willow Garage, Inc. nor the names
;;    of its contributors may be used to endorse or promote
;;    products derived from this software without specific
;;    prior written permission.
;;
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
;; CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
;; WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
;; PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
;; COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
;; INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
;; PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;; DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
;; CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
;; OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
;; DAMAGE.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; tags for using the snippet in wiki
;; %Tag(wikiTalker)%

(in-package :roslisp-tutorials)

(defun add-two-ints-client (a b)
  "adds by calling ros service"
  (with-ros-node ("two_ints_client")
    (if (not (wait-for-service "add_two_ints" 10))
      (ros-warn nil "Timed out waiting for service add_two_ints")
      (format t "~a + ~a = ~a~&"
              a b (sum (call-service "add_two_ints" 'AddTwoInts :a a :b b))))))


(defun add-two-ints-client-main ()
  ;; parse command line args
  (let ((args (cdr sb-ext:*posix-argv*)))
    (if (not (= 2 (length args)))
      (ros-info (roslisp-tutorials) "Error ~a~%usage: add_two_ints_client X Y" args)
      ;; else
      (add-two-ints-client (parse-integer (first args))
           (parse-integer (second args))))))

;; %EndTag(wikiTalker)%
