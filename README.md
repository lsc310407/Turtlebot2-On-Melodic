# Turtlebot2-On-Melodic
Make your [Turtlebot2](https://www.turtlebot.com/turtlebot2/) run on ROS Melodic (Ubuntu 18.04).

![](https://www.turtlebot.com/assets/images/turtlebot_2_lg.png)

This project referenced [this issue](https://github.com/turtlebot/turtlebot/issues/272). Thanks to the work of [bunchofcoders](https://github.com/bunchofcoders) and [ProfJust](https://github.com/ProfJust).

## Installation
We assume that you have installed [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu) 
and the script will install turtlebot in a new workspace `~/turtlebot_ws`.

```
wget https://raw.githubusercontent.com/UCR-Robotics/Turtlebot2-On-Melodic/master/install_turtlebot.sh
chmod +x install_turtlebot.sh
./install_turtlebot.sh
```

## Usage

### Gazebo Simulation

```
roslaunch turtlebot_gazebo turtlebot_world.launch
```

### Real Robot
```
roslaunch turtlebot_bringup minimal.launch
```

### Keyboard Teleopration

This should work for both Gazebo simulation and real robots. 
```
roslaunch turtlebot_teleop keyboard_teleop.launch
```

## Note
There is a known issue when running Gazebo in Ubuntu 18, which can cause the model spawn service to fail. The error message is `[Err] [REST.cc:205] Error in REST request`.

Solution: open the file `~/.ignition/fuel/config.yaml` and replace the url inside from `https://api.ignitionfuel.org` to `https://api.ignitionrobotics.org`.

