#!/bin/bash

function onexit {
        #kill $RENODE
        killall mono
        cat test_output.txt | grep -i warn > ./port.warnings.txt
}

trap onexit EXIT

renode --console --disable-xwt test_cc1352.rscr | tee test_output.txt &
# TODO: find the name of the variable holding the last executed process background PID
#RENODE=$$
sleep 40
