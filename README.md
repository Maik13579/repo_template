# Repo template
A template for my repos

The name of the project is the name of the directory, the setup.bash script will rename all the stuff


## Getting started
Create a empty directory 
```bash
mkdir my-fancy-repo
```
Go inside
```bash
cd my-fancy-repo
```

Clone this repo
```bash
git clone https://github.com/Maik13579/repo_template.git
```

If you are not me you should change the first variables in `repo_template/setup.bash`

execute `setup.bash`
```bash
./repo_template/setup.bash
```

### Or put that in your ~/.bashrc
```bash
create_repo(){
    if [[ -z ${1} ]];
    then
            echo "usage: create_repo [name]"
    else
        mkdir $1
        cd $1
        git clone https://github.com/Maik13579/repo_template.git
        ./repo_template/setup.bash
    fi
}
```

## Authors
 - Maik Knof; Maik.Knof@gmx.de
