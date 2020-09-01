sudo apt-get install libfcl0.5 libfcl-0.5-dev scons libbson-dev libglew-dev libglew1.13 ros-noetic-octomap ros-noetic-octomap-mapping ros-noetic-octomap-msgs ros-noetic-octomap-ros ros-noetic-octomap-rviz-plugins ros-noetic-octomap-server ros-noetic-geometric-shapes ros-noetic-warehouse-ros ros-noetic-srdfdom ros-noetic-object-recognition-msgs ros-noetic-navigation ros-noetic-ivcon ros-noetic-convex-decomposition

# Install OMPL from source and place symbolic links
# wget http://ompl.kavrakilab.org/install-ompl-ubuntu.sh
chmod u+x install-ompl-ubuntu.sh
./install-ompl-ubuntu.sh
sudo ln -s /usr/local/include/ompl /opt/ros/noetic/include/ompl
sudo mkdir -p /opt/ros/noetic/lib/x86_64-linux-gnu
sudo ln -s /usr/local/lib/libompl.so /opt/ros/noetic/lib/x86_64-linux-gnu/libompl.so