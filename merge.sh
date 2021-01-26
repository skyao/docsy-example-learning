#!/bin/bash
echo "Begin to merge learning-clean branch of docsy-example repo"
workPath=$(dirname $0)
cd $workPath
echo "work path is $workPath"
workPath=$(pwd)
targetProject=$1
echo "change work path to abstract $workPath"
echo "cd $workPath"
cd $workPath

if [ -z "$targetProject" ];then
  echo "target project is not provided: use merge.sh ***. exit."
  exit 1
fi
targetProject="learning-$1"
projectPath="$workPath/$targetProject"

if [ ! -d "$projectPath" ];then
  echo "$targetProject ($projectPath) not found, exit"
  exit 1
fi

cd $projectPath

echo "Begin to update local repo by 'git pull'..."
git pull
if [ $? -ne 0 ]; then
    echo "Fail to pull project $targetProject, exit"
    exit 1
fi
echo "Success to do 'git pull'"

echo "Begin to fetch remote repo by 'git fetch docsy'..."
git fetch docsy
if [ $? -ne 0 ]; then
    echo "Fail to fetch git remote docsy, exit"
    exit 1
fi
echo "success to do 'git fetch docsy'"

echo "Begin to merge remote repo by 'git merge docsy/learning-clean'..."
git merge docsy/learning-clean
if [ $? -ne 0 ]; then
    echo "Fail to merge learning-clean branch to project $targetProject, exit"
    exit 1
fi
echo "Success to do 'git merge docsy/learning-clean'"


echo "Begin to push project by 'git push'..."
git push
if [ $? -ne 0 ]; then
    echo "Fail to push project $targetProject after, exit"
    exit 1
fi
echo "Success to do 'git push'"
