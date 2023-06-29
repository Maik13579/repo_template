#!/usr/bin/env python3

import rospy

#from [ROS_INTERFACES_NAME].msg import Example

class [PACKAGE_NAME_CAMELCASE]():
    def __init__(self):
        rospy.init_node("[ROS_PACKAGE_NAME]", anonymous=True)
        rospy.loginfo("Starting")
        rospy.spin()


if __name__ == '__main__':
    [PACKAGE_NAME_CAMELCASE]()

