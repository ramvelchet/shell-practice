#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
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

#$@

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    
    if [ $? -ne 0 ]; then
        dnf install $package -y
        VALIDATE $? "$package"
    else 
        echo -e "package already installed ... $Y SKIPPING $N"
    fi
done

