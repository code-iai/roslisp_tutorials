(in-package :roslisp-tutorials)

(defun array-talker ()
  "Illustrates array and compound messages, and rosout functions."
  (with-ros-node ("talker")
    (let ((pub (advertise "array_chatter" '<Test>)))
      (loop-at-most-every 1
           (let ((s (random 10))
                 (p (make-instance '<Point> :x 1.0 :y 2.0 :z 42.0)))
             (publish pub (make-instance '<Test> :location (vector p p)
                                         :orientation (vector (* 2 s) s s))))))))