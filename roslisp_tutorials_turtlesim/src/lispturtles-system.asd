
(asdf:defsystem lispturtles-system
  :depends-on (roslisp
               turtlesim-msg
               geometry_msgs-msg
               turtlesim-srv)
  :components
  ((:module "lispturtles"
    :components
    ((:file "package")
     (:file "lispturtles-core" :depends-on ("package"))))))
