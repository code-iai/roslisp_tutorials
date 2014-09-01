(defsystem roslisp-tutorials
    :depends-on (roslisp std_msgs-msg roslisp_tutorials-msg
                         roslisp_tutorials-srv)
    :components
    ((:module "src"
              :components
              ((:file "pkg")
               (:file "talker" :depends-on ("pkg"))
               (:file "listener" :depends-on ("pkg"))
               (:file "add-two-ints-client" :depends-on ("pkg"))
               (:file "add-two-ints-server" :depends-on ("pkg"))
               (:file "array-talker" :depends-on ("pkg"))
               (:file "array-listener" :depends-on ("pkg"))
               (:file "params" :depends-on ("pkg"))
               (:file "rosout-example" :depends-on ("pkg"))))))

