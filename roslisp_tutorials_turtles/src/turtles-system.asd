
(asdf:defsystem turtles-system
  :depends-on (roslisp
               turtlesim-msg
               geometry_msgs-msg
               turtlesim-srv)
  :components
  ((:module "turtles"
    :components
    ((:file "package")
     (:file "turtles-core" :depends-on ("package"))))))
