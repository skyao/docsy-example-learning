#!/bin/bash
targetProject=$1

if [ -z "$targetProject" ];then
  echo "target project is not provided: use clone.sh ***. exit."
  exit 1
fi
targetProject="learning-$1"
projectPath="/home/sky/work/code/learning2/$targetProject"

if [ -d "$projectPath" ];then
  echo "$targetProject ($projectPath) exist"
  exit 1
fi

git clone git://github.com/skyao/$targetProject.git
if [ $? -ne 0 ]; then
    echo "Fail to clone project $targetProject, exit"
    exit 1
fi

sh addremote.sh $1
if [ $? -ne 0 ]; then
    echo "Fail to add remote for project $targetProject, exit"
    exit 1
fi

sh init.sh $1
if [ $? -ne 0 ]; then
    echo "Fail to init project $targetProject, exit"
    exit 1
fi
