cmake_minimum_required(VERSION 2.8.3)
project(roslisp_tutorials_basics)

find_package(catkin REQUIRED COMPONENTS
  roslisp
  std_msgs
  message_generation
)

add_message_files(
  FILES
  Point.msg
  Test.msg
)

add_service_files(
  FILES
  AddTwoInts.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_package(
  CATKIN_DEPENDS roslisp std_msgs message_runtime
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)


add_lisp_executable(talker
  roslisp-tutorials-basics roslisp-tutorials-basics:talker)
add_lisp_executable(listener
  roslisp-tutorials-basics roslisp-tutorials-basics:listener)
add_lisp_executable(add-two-ints-client
  roslisp-tutorials-basics roslisp-tutorials-basics:add-two-ints-client-main)
add_lisp_executable(add-two-ints-server
  roslisp-tutorials-basics roslisp-tutorials-basics:add-two-ints-server)
add_lisp_executable(params-example
  roslisp-tutorials-basics roslisp-tutorials-basics:params-example)
add_lisp_executable(rosout-example
  roslisp-tutorials-basics roslisp-tutorials-basics:rosout-example)
add_lisp_executable(array-talker
  roslisp-tutorials-basics roslisp-tutorials-basics:array-talker)
add_lisp_executable(array-listener
  roslisp-tutorials-basics roslisp-tutorials-basics:array-listener)