#!/bin/bash
declare -A dirs
dirs=(["java"]="java_micro_srvs" ["php"]="php" ["node"]="nodejs_srvs")
BASE_DIR="/home/opt/env_scripts/"
CONFIG_DIR="data/service_config"
DEPLOY_DIR="scripts/"
DEPLOY_FILE="deploy.list"
BUILD_FILE="build.py"

#change deploy tag
FILE_NAME=${BASE_DIR}${DEPLOY_DIR}${dirs[$1]}"/"${DEPLOY_FILE}
echo ${2}" Now deployed :" $(sed -n '/^'${2}'/p' $FILE_NAME)
read -p "Please input a new tag: " NEW_TAG
sed -i 's/^'${2}'.*/'${2}': '${NEW_TAG}'/' $FILE_NAME

while :
read -n 1 -p "Deploy "${2}" now? Y/n: " deploy_now
do
    case $deploy_now in
        [yY])
            #package image
            python /home/opt/env_scripts/scripts/java_micro_srvs/build.py

            #build docker image
            cd /home/opt/env_scripts/composefiles && docker-compose -f java.compose.yml up -d --build
            ;;

        [nN])
            echo ""
            exit 1
            ;;

        *)
            echo "Invalid input"
            ;;
    esac
done
