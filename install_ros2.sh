#! /bin/sh

ROS2_version="humble"

# update the device to the latest package definitions
sudo apt update && sudo apt upgrade -y
sudo apt install locales

# enable the ros2 apt repository
sudo apt install software-properties-common -y
sudo add-apt-repository universe

# add the ROS2 GPG key to the programs and add it to the  sources list
sudo apt update && sudo apt install curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# update the apt repo and install any new updates
sudo apt update && sudo apt upgrade -y
sudo apt install ros-$ROS2_version-desktop ros-$ROS2_version-ros-base ros-dev-tools -y

# add humble to sources list
echo "source /opt/ros/$ROS2_version/setup.bash" >> ~/.bashrc

echo "ROS2 version: $ROS2_version is installed"

