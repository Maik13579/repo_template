#!/usr/bin/env python3

import rospy

#from [ROS_INTERFACES_NAME].msg import Example

class [PACKAGE_NAME_CAMELCASE]():
    def __init__(self):
        rospy.init_node("[ROS_PACKAGE_NAME]", anonymous=True)
        rospy.loginfo("Starting")
        
        # Publisher
        #self.pub = rospy.Publisher(TOPIC, MSG, queue_size=10)

        # Subscriber
        #rospy.Subscriber(TOPIC, MSG, CALLBACK)

        #Execute main loop
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            self.loop()
            rate.sleep()

    def loop(self):
        '''
        main loop
        '''
        rospy.loginfo('Looping')



if __name__ == '__main__':
    [PACKAGE_NAME_CAMELCASE]()

