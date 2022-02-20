#!/bin/bash
# ===============================================================
# Script Name....: web_health_check.sh
# Server.........: Linux servers
# Function.......: Health Check server & web application status
# Creation Date..: May 19th, 2021
#
# Created by.....: Fabiano Souza
# ================================================================                 

AWSCLI_PROFILE="default"
SNS_TOPIC_ARN="<your sns top arn>"
declare -a SERVER_NAME=("server ip" "server ip")
SUBJECT_PREFIX="Web Application Health Check"
WEB_OK="200"
CHK_WEB_STATUS=$(/usr/bin/curl --write-out %{http_code} --silent --output /dev/null $SERVER_NAME)


for SERVER in "${SERVER_NAME[@]}"
do
  # Step to check if servers is running 
  ping -c 1 $SERVER > /dev/null 2>&1
  if [ $? -ne 0 ]
  then
     /usr/local/bin/aws --profile="${AWSCLI_PROFILE}" sns publish \
      --topic-arn="$SNS_TOPIC_ARN" \
      --message "SERVER $SERVER IS NOT RUNNING" \
      --subject "$SUBJECT_PREFIX - Server Status "

    echo "SERVER $SERVER IS NOT RUNNING"
  
  # Step to check application status
  elif [[ "$CHK_WEB_STATUS" != "200" ]]
    then
      echo "Execution started at: ${CHK_WEB_STATUS}"
      /usr/local/bin/aws --profile="${AWSCLI_PROFILE}" sns publish \
        --topic-arn="$SNS_TOPIC_ARN" \
        --message "WEB PAGE ISSUE on webserver $SERVER" \
        --subject "$SUBJECT_PREFIX - WEB PAGE ISSUE "
        echo "WEB PAGE ERROR: ${CHK_WEB_STATUS} on server $SERVER"
  fi
done