#!/usr/bin/python2
#
# A driver for RoboDK to tranfer targets over the network and into ring buffers. hopefully. 
#
# 
#
# 
#
import sys
from robolink import *    # RoboDK's API
from robodk import *      # Math toolbox for robots
from machinekit import hal
import linuxcnc

import socket
RDK = Robolink()

#Parameters to connect to the robot is being set
HOST = "10.10.10.5" #robot ip
PORT = 30002 #port to connect to

# robot and tool object is being set
robot = RDK.Item('Select a robot', ITEM_TYPE_ROBOT)
tool = RDK.Item('Gripper')


RDK.setSimulationSpeed(1)
robot.setSpeed(1500, 1500, 2000, 180)



def main():
    

if __name__ == "__main__":
    main()
