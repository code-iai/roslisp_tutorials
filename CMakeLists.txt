cmake_minimum_required(VERSION 2.8.3)
project(roslisp_tutorials)

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


# rosbuild_add_lisp_executable(bin/talker
#   roslisp-tutorials roslisp-tutorials:talker)
# rosbuild_add_lisp_executable(bin/listener
#   roslisp-tutorials roslisp-tutorials:listener)
# rosbuild_add_lisp_executable(bin/add-two-ints-client
#   roslisp-tutorials roslisp-tutorials:add-two-ints-client-main)
# rosbuild_add_lisp_executable(bin/add-two-ints-server
#   roslisp-tutorials roslisp-tutorials:add-two-ints-server)
# rosbuild_add_lisp_executable(bin/params-example
#   roslisp-tutorials roslisp-tutorials:params-example)
# rosbuild_add_lisp_executable(bin/rosout-example
#   roslisp-tutorials roslisp-tutorials:rosout-example)
# rosbuild_add_lisp_executable(bin/array-talker
#   roslisp-tutorials roslisp-tutorials:array-talker)
# rosbuild_add_lisp_executable(bin/array-listener
#   roslisp-tutorials roslisp-tutorials:array-listener)