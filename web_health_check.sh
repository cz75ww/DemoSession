#!/bin/bash
# ===============================================================
# Script Name....: web_health_check.sh
# Server.........: Linux servers
# Function.......: Health Check web application status
# Creation Date..: May 19th, 2021
#
# Created by.....: Fabiano Souza
# ================================================================                 

AWSCLI_PROFILE="default"
SNS_TOPIC_ARN="arn:aws:sns:us-east-1:076489258907:NotifyMe"
SERVER_NAME="18.232.86.198"
SUBJECT_PREFIX="Web Application Health Check"
WEB_OK="200"

CHK_WEB_STATUS=$(/usr/bin/curl --write-out %{http_code} --silent --output /dev/null $SERVER_NAME)
echo "Execution started at: ${CHK_WEB_STATUS}"

if [[ "$CHK_WEB_STATUS" != "200" ]]
then
	/usr/local/bin/aws --profile="${AWSCLI_PROFILE}" sns publish \
    --topic-arn="$SNS_TOPIC_ARN" \
    --message "WEB PAGE ISSUE on webserver $SERVER_NAME" \
    --subject "$SUBJECT_PREFIX - WEB PAGE ISSUE "

  echo "WEB PAGE ERROR: ${CHK_WEB_STATUS} on server $SERVER_NAME"
fi