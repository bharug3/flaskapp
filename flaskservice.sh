#!/bin/bash

sudo yum install pip -y 
pip install flask 

filepid=filepid
Running=N

if [ -f "${filepid}" ]; then
        PID="$(cat filepid)"
        if [ ! -z "$PID" ] && kill -0 "${PID}" 2>/dev/null; then
            Running=Y
        fi
fi

startfunction(){
    if [ $Running == "Y" ]; then
        echo "service is already running"

    else 
        echo "Starting service"
        nohup python app.py > flaskservice.log 2>&1 &
        echo "$!" > filepid
        echo "PID: $!"
        # tail -f flaskservice.log
    fi
}


stopfunction(){
    if [ -f "${filepid}" ]; then
        PID="$(cat filepid)"
        kill -9 "${PID}"
        echo "stopped the service"
        rm -rf "${filepid}"
    else
        echo "service is already stopped"
    fi
}

restartfunction(){
    echo "Restarting service"
}

case "$1" in

    'start')
        startfunction
        ;;
    
    'stop')
        stopfunction
        ;;

    'restart')
        restartfunction
        ;;
    
    *)
        echo "Usage: $0 { start| stop| restart }"
        exit 1
        ;;
esac
exit 0