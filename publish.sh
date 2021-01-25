#!/bin/bash
targetProject=$1

if [ -z "$targetProject" ];then
  echo "target project is not provided: use build-leaning.sh ***. exit."
  exit 1
fi
targetProject="learning-$1"
projectPath="/home/sky/site/$targetProject"

if [ ! -d "$projectPath" ];then
  echo "$targetProject ($projectPath) not found, exit"
  exit 1
fi

# init project if need 
sh ./init.sh $1
if [ $? -ne 0 ]; then
    echo "Fail to init project $targetProject, exit"
    exit 1
fi

cd $projectPath
echo "cd $projectPath"

echo "Start to build $targetProject ..."
rm -rf public 
env HUGO_ENV="production" hugo --baseUrl="https://skyao.io/${targetProject}/"
if [ $? -ne 0 ]; then
    echo "Fail to build html content by hugo, exit"
    exit 1
fi
echo "Success to build $targetProject"

publishPath="/var/www/skyao/${targetProject}/"
echo "Start to publish $targetProject ..."
rm -rf $publishPath
if [ $? -ne 0 ]; then
    echo "Fail to remove $publishPath, exit"
    exit 1
fi
cp -r public $publishPath
if [ $? -ne 0 ]; then
    echo "Fail to copy files to $publishPath, exit"
    exit 1
fi
echo "Suceess to publish $targetProject to $publishPath"
echo "Done"

