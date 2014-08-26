(in-package :roslisp-tutorials)

(defun talker ()
  "Periodically print a string message on the /chatter topic"
  (with-ros-node ("talker")
    (let ((i 0) (pub (advertise "chatter" "std_msgs/String")))
      (loop-at-most-every .1
         (publish-msg pub :data (format nil "foo ~a" (incf i)))))))
