# Repo template
A template for my repos

The name of the project is the name of the directory, the setup.bash script will rename all the stuff

After executing the script the project contains:
- **docker** 
  - **Dockerfile** for building and testing the source code
  - **docker-compose.yml** for starting the container
  - **common.yml** out sourced stuff from docker-compose.yml
  - **ros_entrypoint.sh** entrypoint for the container
- **ros_package** this repo will be renamed
  - **CMakeLists.txt**
  - **package.xml**
  - **setup.py**
  - **src** main.py will end up here
- **ros_package_interfaces** will be renamed
  - **CMakeLists.txt**
  - **package.xml**
- **tests**
  - **unit_tests** will contain a example test
- **README.md**

## Getting started
Create a empty directory 
```
mkdir my-fancy-repo
```
Go inside
```
cd my-fancy-repo
```

Clone this repo
```
git clone https://github.com/Maik13579/repo_template.git
```

If you are not me you should change the first variables in `repo_template/setup.bash`

execute setup.bash
```
./repo_template/setup.bash
```

## Authors
 - Maik Knof; Maik.Knof@rwu.de
