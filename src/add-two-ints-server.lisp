(in-package :roslisp-tutorials)

(def-service-callback AddTwoInts (a b)
  (make-response :sum (+ a b)))

(defun add-two-ints-server ()
  (with-ros-node ("two_ints_server" :spin t)
    (register-service "add_two_ints" 'AddTwoInts)))