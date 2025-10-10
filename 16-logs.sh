#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

LOGS_FOLDER= "/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelage"  | tee -a $LOG_FILE
    exit 1
fi

VALIDATE(){ #
   if [ $1 -ne 0 ]; then
        echo -e  "Installing $2.... $R is FAILURE $N"
        exit 1
    else 
        echo -e "Installing $2... $G is SUCCESS $N" | tee -a $LOG_FILE
    fi 
}

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "MySQl already exists... $Y skipping $N"  | tee -a $LOG_FILE
fi 

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "nginx already exists...$Y skipping $N"  | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "python already exists...$Y skipping $N"  | tee -a $LOG_FILE
fi



