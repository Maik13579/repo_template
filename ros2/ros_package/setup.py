from setuptools import setup

package_name = '[ROS_PACKAGE_NAME]'

data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ]

setup(
    name=package_name,
    version='[VERSION]',
    packages=[package_name],
    data_files=data_files,
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='[AUTHOR]',
    maintainer_email='[AUTHOR_EMAIL]',
    description='TODO: Package description',
    license='TODO: License declaration',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
                '[ROS_PACKAGE_NAME]_node = [ROS_PACKAGE_NAME].[ROS_PACKAGE_NAME]_node:main',
        ],
    },
)
