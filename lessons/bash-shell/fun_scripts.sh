#!/bin/bash

## ********************* add space with sed   ******************************

# sed '21i \       \ ma-01.ma.osh.com\:' ma2-23.yml

for host in `cat hosts.txt`; do

        if  grep -q $host ra2-2300.yml; then
                echo " "
                echo $host exists,  skipping...
                echo " "
        else
                GROUP=`echo $host | awk -F '-' {'print $3'}`
                GROUP_NUM=`grep -nr ${GROUP}: ra2-2300.yml | awk -F ':' {'print $1'}`
                INSERT_NUM=`expr ${GROUP_NUM} + 2`

                echo " "
                echo "$host doesn't exist, adding it to recipe..."
                echo " "
               sed -i "${INSERT_NUM}i \       \ $host\:" ra2-2300.yml
        fi
done




## ********************* bash options  ******************************

function usage() {
        echo "Usage: ${0##*/} [-s <disk_size>] [-u <user name>]"
        echo "-s <disk_size> with postfix e.g. 2G        default: 1024M"
        echo "-u <user name>                     default: none"
}

while getopts "s:u:h-:" opt; do
        case "${opt}" in
                -)
                        echo "  Invalid argument: $OPTARG"
                        usage
                        exit 1
                ;;
                s)
                        size=$OPTARG
                ;;
                h)
                        usage
                        exit 0
                ;;
                u)
                        user_label=$OPTARG
                ;;
                *)
                        echo "  Invalid argument: $OPTARG"
                        usage
                        exit 1
                ;;
        esac
done


---- bul optiondu berip jana valusun dagy CLI dan----------  options step by step ----------------

while getopts "s:u:h" opt; do


        echo $OPTARG              # $OPTARGS value for option M:  ./sh.sh  -s LOLA  desen, echo $OPTARGS --> LOLA chygat
	echo $opt                 # 's'  chygat 

done

-----------------------------------------------------------------------------------------

while getopts 'a:u:h' opt ; do

        case $opt in
                a) echo bul option ALL=$opt ;;
                u) echo bul username is $OPTARG, option is $opt ;;
                h) usage ;;
                *) echo Give correct option

        esac
done

## *********************  new function  ******************************


get_available_port () {
  read LOWERPORT UPPERPORT < /proc/sys/net/ipv4/ip_local_port_range
  while :
  do
    PORT="`shuf -i $LOWERPORT-$UPPERPORT -n 1`"
    ss -lpn | grep -q ":$PORT "  || break
  done
  echo $PORT
}

echo $(get_available_port)


## *********************  read token  ******************************


#!/bin/bash

while read p; do

	  read -a line <<< "$p"
	    echo ${line[0]}

    done </samba/mir/miki.txt



    # while read p; do
    #   if [[ ! $p == \#* ]]
	    #   then
    #     if [[ "$p" =~ [^a-zA-Z0-9] ]]
    #     then
    #       IFS=' ' read -a token <<< "$p"
    #       git clone ${token[1]} ${token[0]}
    #       cd ${token[0]}
    #
    #       if [ "${token[2]}" = "master" ]
    #       then
    #         git checkout ${token[3]}
    #       else
    #         git checkout -b ${token[2]} ${token[3]}
    #       fi
    #
    #       cd /opt/stack
    #     fi
    #    fi
    # done </home/stack/s_commit_ids
    # echo -e "done cloning the Stack repos \n"

# --------------------------------------------------------------------------------------------------------------------

#!/bin/bash

help (){
        cat << EOF

-m --- module   \$module

-t ---  testcases in the file  \$test_list_file

-a --- ABI     \$abi

-s ---  serial |  \$host

-h --  help

example:  ./start.sh -m CtsTestcases -t ~/tests.txt -a x86_64 -s 5-5-5


EOF
        exit 0
}


while getopts "s:t:a:m:h" option ; do
        case $option in

                s) host=$OPTARG ;;

                t) test_list_file=$OPTARG ;;

                a) abi=$OPTARG ;;

                m) module=$OPTARG ;;

                h) help ;;

                *) echo "Please provide currect options. see 'start.sh -h' "
                   help


        esac

done

results_file=./results_file.txt


tools_path=$PWD
cd $tools_path


echo "++++++++++++++++++++++++++++++++++++++++ $abi STARTED ++++++++++++++++++++++++++++++++++++++" >> $results_file
echo "" >> $results_file

for test in `cat $test_list_file`; do

    for i in {1..4};do

        while true; do
            echo '\n' | ~/bin/DUT_login_connect.sh $host
            adb devices | grep $host:22
            if [ $? == '1' ]; then
                    continue
            else

                ./cts-tradefed run commandAndExit cts -m $module -t $test -s $host:22 -a $abi -d -o --disable-reboot
                echo "" >> $results_file
                echo $test >> $results_file
                ./cts-tradefed list results 2>/dev/null | tail -n3 | head -n1 >> $results_file
            fi
            break
        done #while

                passed=`cat $results_file | tail -n1 |  awk '{if ($2 ~ "1") print $2}'`
                if [[ $passed == 1 ]]; then
                                break
                fi
    done # for loop {1..5}


done # for loop `cat test_list_file`


