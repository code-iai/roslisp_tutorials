(in-package :roslisp-tutorials-basics)
 
(defun array-listener ()
  "Like listener, except illustrates an array message."
  (with-ros-node ("listener" :spin t)
    (subscribe "array_chatter" '<Test>
               #'(lambda (x) (ros-info nil "~&Location is ~a and orientation is ~a" (location-val x) (orientation-val x))))))
