
## Install PR2 and Nav2d on ROS Neotic

===============
Thanks to this repository:
[kinetic_pr2](https://github.com/RichardKelley/kinetic_pr2/)


### Installation

------------
<!-- 
This installation assumes your machine has Ubuntu 16.04 and the Kinetic version of ROS already installed. 
If you haven't installed Kinetic, follow this link for install instructions: http://wiki.ros.org/kinetic/Installation/Ubuntu
Make sure to edit your `.bashrc` file after the install!  -->

Install the Noetic on Ubuntu20.04

Install the package 

 ``sudo apt-get install ros-noetic-move-base ros-noetic-convex-decomposition ros-noetic-rosboost-cfg ros-noetic-navigation ros-noetic-object-recognition-msgs ros-noetic-joystick-drivers ros-noetic-fcl* install libfcl-dev ros-noetic-geometric-shapes ros-noetic-warehouse-ros ros-noetic-eigenpy ros-noetic-rosparam-shortcuts``
 
 ``pip3 install pyplusplus pygccxml ``

 ``sudo apt-get install libpcl-dev pcl-tools``


Then run this script.

 ``./install_pr2_kinetic.sh`` 
 
This will install the necessary packages via apt. Then it will download and run the OMPL install script.

Once OMPL is installed, you can initialize your catkin workspace in your location of choice by: 

``cd catkin_ws``. 

Now in the root of your workspace run:

``catkin_make`` 

to build everything. 

From there you can source `/catkin_ws/devel/setup.bash`, simulate the PR2, and run Moveit.


### Attention with modifying

1. I remove the boost signals and sdf package in these CMakeList：

 ``find_package(Boost REQUIRED COMPONENTS signals)`` 
 ``pkg_check_modules(SDF sdformat REQUIRED)`` 

Because Boost 1.69 removed the old signals library entirely, so the otherwise
useless `COMPONENTS signals` actually breaks the build.
And the Noetic have sdf moudule already.

[Ref: build erros](https://github.com/ros/geometry2/pull/354/files)


2. If you find packages supported on Noetic， you can remove the package folder from 'catkin_ws/src/.' .
Then install them using apt.

[Ref:ROS Wiki](https://wiki.ros.org/)

如果catkin_ws/src中的库已经支持ROS Noetic，可以把相应库删除，直接用apt来安装。是否支持Noetic可以在ROS wiki上面查询。

3. Catkin_make has ``Invoking "make -j1 -l1" failed`` Error.

error: #error PCL requires C++14 or above at pr2_navigation_self_filter

Remove the ``set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")`` and then add
 ``set( CMAKE_CXX_STANDARD 14)`` in the CMAKELIST of pr2_navigation_self_filter.


---

### Test

Makesure you have launch the ros bridge suit.

[Ref：Nav2d Example](https://github.com/GT-RAIL/nav2djs)