#!/bin/bash
workPath=$(dirname $0)
cd $workPath
echo "work path is $workPath"
workPath=$(pwd)
targetProject=$1
echo "change work path to abstract $workPath"
echo "cd $workPath"
cd $workPath

templateProject="docsy-example"

if [ -z "$targetProject" ];then
  echo "target project is not provided: use migrate.sh ***. exit."
  exit 1
fi

targetProject="learning-$1"
projectPath="$workPath/$targetProject"

if [ ! -d $targetProject ];then
  echo "$targetProject directory not found, exit"
  exit 1
fi

if [ ! -d $templateProject ];then
  echo "$templateProject directory not found, exit"
  exit 1
fi

cd $targetProject

# remove unuse files
rm book.json SUMMARY.md .gitignore
# move old content of book
mkdir -p content/docs
mv `ls | grep -v README.md | grep -v content` content/docs
mv README.md README2.md

# copy files from template
cd ../$templateProject

cp -r .gitignore assets config.toml content layouts *.json *.sh ../$targetProject
cp ../learning-hugo/README.md ../$targetProject
