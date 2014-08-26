(in-package :roslisp-tutorials)

(defun listener ()
  (with-ros-node ("listener" :spin t)
    (subscribe "chatter" "std_msgs/String" #'print)))