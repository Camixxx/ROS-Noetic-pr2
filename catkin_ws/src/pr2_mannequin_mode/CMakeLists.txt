cmake_minimum_required(VERSION 2.8.3)
project(pr2_mannequin_mode)

find_package(catkin REQUIRED COMPONENTS
  pr2_controller_manager
  pr2_controllers_msgs
  trajectory_msgs
)
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES pr2_mannequin_mode
#  CATKIN_DEPENDS pr2_controller_manager pr2_controllers_msgs trajectory_msgs
#  DEPENDS system_lib
   CATKIN_DEPENDS trajectory_msgs pr2_controllers_msgs 
)
include_directories(
  ${catkin_INCLUDE_DIRS}
)

install(PROGRAMS scripts/trajectory_lock.py
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/scripts
)

install(DIRECTORY config launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

install(FILES icon.png
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

# test
if(CATKIN_ENABLE_TESTING)
  find_package(roslaunch REQUIRED)
  find_package(rostest REQUIRED)
  file(GLOB LAUNCH_FILES launch/*.launch)
  foreach(LAUNCH_FILE ${LAUNCH_FILES})
    message(STATUS "Testing ${LAUNCH_FILE}")
    roslaunch_add_file_check(${LAUNCH_FILE})
  endforeach()
endif()
