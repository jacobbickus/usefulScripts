#!/bin/bash
#set -x
#trap read debug
echo This Script makes a new repository on github
read -p "Enter your github username: " USERNAME
echo Enter cancel to cancel
read -p "Enter the New Repository Name: " REPONAME

if [ "$REPONAME" != "cancel" ];
    then
    echo "Making Repository $REPONAME"
    VAR1='"name"'
    VAR2="'{$VAR1:"
    VAR3='"'
    VAR4="$VAR3$USERNAME$VAR3"
    VAR5="curl -u $VAR4 https://api.github.com/user/repos -d $VAR2$VAR3$REPONAME$VAR3}'"
    echo $VAR5
    eval "$VAR5"
    
    echo Repository $REPONAME made.
    read -p "Would you like to finish filling the Repository?(Y/N)" ANSWER
    
    if [ "$ANSWER" = "Y" ];
        then
        git init
        echo 'Input the file name or enter "current_directory" for the current directory'
        read -p "Enter File Name: " FILENAME
        
        if [ "$FILENAME" = "current_directory" ];
            then
            git add .
        
        else
            FAILFILE="NotFail"
            VARFILE="git add $FILENAME"
            eval "$VARFILE" || read -p "File not Found. Check Spelling. Enter File Name: " FAILFILE
            while [ "$FAILFILE" != "NotFail" ]
                do
                    EXFAILFILE="git add $FAILFILE"
                    eval "$EXFAILFILE" && FAILFILE="NotFail" || read -p "File not Found. Check Spelling. Enter File Name: " FAILFILE
            done
        fi
        
        VAR6='"Respository"'
        VAR7="git commit -m $VAR6"
        eval "$VAR7"
        VAR8="git remote add newRepoSetup https://github.com/$USERNAME/$REPONAME"
        echo "$VAR8"
        eval "$VAR8" || echo "remote newRepoSetup already existed in this file/directory"
        git push -u newRepoSetup master || echo "FATAL ERROR PUSH FAILED"
        echo "Finished."
    
    else
        echo "****You Chose to NOT Fill the new Repository****"
        echo "Listing Usefull following commands..."
        echo "git init"
        echo "git add <files>"
        echo "git commit -m <message>"
        echo "git remote add origin https://github.com/USERNAME/REPONAME"
        echo "git push -u origin master"
    fi
    
else
    echo "Canceling..."
fi
