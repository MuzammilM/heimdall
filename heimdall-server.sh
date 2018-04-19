#Author : MuzammilM
#Created on 2018-04-09

sleep 30s
z=`ls ~/logs/checks/`
for sname in $z; do
        echo "*****************************"
        echo $sname
        cdate=`/bin/date +'%H%M'`
        cdatepre=`/bin/date -d '-1 minute' +'%H%M'`
        fdate=`ls ~/logs/checks/$sname/\`date +'%Y-%m-%d'\`/ | tail -n 1`
        if [ "$cdate" -eq "$fdate" ] || [ "$fdate" -eq "$cdatepre" ];then
                echo "Working";
        else
                /usr/bin/slackBot sre "Check ssh connection on "$sname
                echo "Check ssh connection on "$sname
        fi

        echo $fdate "Folder Date"
        echo $cdate "Current Date"
done
