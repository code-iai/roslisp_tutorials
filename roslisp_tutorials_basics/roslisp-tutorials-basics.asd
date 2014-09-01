(defsystem roslisp-tutorials-basics
    :depends-on (roslisp std_msgs-msg roslisp_tutorials_basics-msg
                         roslisp_tutorials_basics-srv)
    :components
    ((:module "src"
              :components
              ((:file "package")
               (:file "talker" :depends-on ("package"))
               (:file "listener" :depends-on ("package"))
               (:file "add-two-ints-client" :depends-on ("package"))
               (:file "add-two-ints-server" :depends-on ("package"))
               (:file "array-talker" :depends-on ("package"))
               (:file "array-listener" :depends-on ("package"))
               (:file "params" :depends-on ("package"))
               (:file "rosout-example" :depends-on ("package"))))))

