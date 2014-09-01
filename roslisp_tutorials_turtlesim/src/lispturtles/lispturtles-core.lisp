
(in-package :lturtle)

(defun start-node ()
  (roslisp:start-ros-node "lispturtles"))

(defun stop-node ()
  (roslisp:shutdown-ros-node))

(defun reset-turtlesim ()
  (roslisp:call-service "/reset" 'std_srvs-srv:empty))

(defun clear-turtlesim ()
  (roslisp:call-service "/clear" 'std_srvs-srv:empty))

(defun spawn-turtle (&key (x 0) (y 0) (theta 0))
  (turtlesim-srv:name
   (roslisp:call-service "/spawn" 'turtlesim-srv:spawn
                         :x x :y y :theta theta)))

(defun unspawn-turtle (name)
  (roslisp:call-service "/kill" 'turtlesim-srv:kill :name name))

(defun set-turtle-velocity (name &key (lin 0) (ang 0))
  "Publishes a velocity command once."
  (let ((pub (advertise
              (concatenate 'string "/" name "/cmd_vel")
              "geometry_msgs/Twist")))
    (publish pub (make-msg "geometry_msgs/Twist"
                           (x linear) lin (z angular) ang))))

(defun set-pen (name &key (r 0) (g 0) (b 0) (width 1) (off 0))
  "Changes the color of the turtle trajectory."
  (roslisp:call-service
   (concatenate 'string "/" name "/set_pen")
   'turtlesim-srv:setpen :r r :g g :b b :width width :off off))

(defun turtle-circle ()
  "main function, draws a circle"
  (with-ros-node ("mynode")
    (set-pen "turtle1" :r 40 :g 90 :b 10)
    (dotimes (x 10)
      (set-turtle-velocity "turtle1" :lin 1 :ang 0.9)
      (sleep 1))))
