#!/usr/bin/env bash

REPOSITORY=/home/ubuntu/cicdproject
cd $REPOSITORY

APP_NAME=cicdproject
JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep 'SNAPSHOT.jar' | tail -n 1)
JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME

CURRENT_PID=$(pgrep -f $APP_NAME)

if [ -z $CURRENT_PID ]
then
  echo "> 종료할것 없음."
else
  echo "> kill -9 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "> $JAR_PATH/$JAR_NAME 배포"
nohup java -jar $REPOSITORY/$JAR_NAME 2>&1 &