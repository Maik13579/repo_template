import rclpy
from rclpy.node import Node
from rclpy.executors import MultiThreadedExecutor

from [ROS_INTERFACES_NAME].msg import Example
from [PYTHON_PACKAGE_NAME] import example_function

class [PACKAGE_NAME_CAMELCASE](Node):
    def __init__(self):
        super().__init__("[ROS_PACKAGE_NAME]")
        self.get_logger().info('Starting')
        
        #Params
        self.declare_parameter('rate', 1)
        rate = self.get_parameter('rate').get_parameter_value().integer_value

        #Publisher
        #self.pub = self.create_publisher(MSG, TOPIC, QUEUE_SIZE)

        #Subscriber
        #self.subscription = self.create_subscription(
        #    MSG,
        #    TOPIC,
        #    CALLBACK,
        #    QUEUE_SIZE)
        #self.subscription  # prevent unused variable warning


        #Timer
        self.timer = self.create_timer(1/rate, self.loop)

    def loop(self):
        '''
        main loop
        '''
        self.get_logger().info(str(Example()))
        example_function()


def main(args=None):
    rclpy.init(args=args)
    try:
        node = [PACKAGE_NAME_CAMELCASE]()
        executor = MultiThreadedExecutor()
        executor.add_node(node)
        try:
            executor.spin()
        finally:
            executor.shutdown()
            node.destroy_node()
    finally:
        rclpy.shutdown()

if __name__ == '__main__':
    main()