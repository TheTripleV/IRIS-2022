# docker base image with 20.04
FROM gitpod/workspace-full-vnc

# Install ROS2
RUN sudo apt update && sudo apt install locales
RUN sudo locale-gen en_US en_US.UTF-8
RUN sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

RUN sudo apt install software-properties-common
RUN sudo add-apt-repository universe
RUN apt-cache policy

RUN sudo apt update && sudo apt install curl gnupg lsb-release
RUN sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN sudo apt update
RUN sudo apt install ros-galactic-desktop

RUN source /opt/ros/galactic/setup.bash


RUN sudo apt install python3-colcon-common-extensions

RUN sudo apt update
RUN sudo apt install -y python3-rosdep
RUN sudo rosdep init
RUN rosdep update

RUN sudo apt install -y libpython3-dev python3-pip

