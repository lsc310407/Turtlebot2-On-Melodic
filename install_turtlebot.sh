#!/usr/bin/env sh
set -e

sudo apt update
sudo apt install git -y
sudo apt install ros-melodic-kobuki-* -y
sudo apt install ros-melodic-ecl-streams -y
sudo apt install ros-melodic-depthimage-to-laserscan -y
sudo apt install ros-melodic-joy -y
sudo apt install ros-melodic-yujin-ocs -y

mkdir -p ~/turtlebot_ws/src
cd ~/turtlebot_ws/src

git clone https://github.com/turtlebot/turtlebot.git
git clone https://github.com/turtlebot/turtlebot_apps.git
git clone https://github.com/turtlebot/turtlebot_msgs.git
git clone https://github.com/turtlebot/turtlebot_interactions.git
git clone https://github.com/turtlebot/turtlebot_simulator.git

git clone https://github.com/yujinrobot/kobuki_desktop.git
rm -rf kobuki_desktop/kobuki_qtestsuite

git clone --single-branch --branch melodic https://github.com/yujinrobot/kobuki.git
mv kobuki/kobuki_description kobuki/kobuki_bumper2pc \
  kobuki/kobuki_node kobuki/kobuki_keyop \
  kobuki/kobuki_safety_controller ./
rm -rf kobuki

# optional; probably for navigation stack
#git clone https://github.com/udacity/robot_pose_ekf.git
#git clone https://github.com/toeklk/orocos-bayesian-filtering.git
#cd orocos-bayesian-filtering/orocos_bfl/
#./configure
#make -j && sudo make install

cd ~/turtlebot_ws
catkin_make

echo "source ~/turtlebot_ws/devel/setup.bash --extend" >> ~/.bashrc
source ~/.bashrc

echo "turtlebot has been installed successfully!"