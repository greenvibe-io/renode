#!/bin/bash

function onexit {
        #kill $RENODE
        killall mono
        cat test_output.txt | grep -i warn > ./port.warnings.txt
}

trap onexit EXIT

renode --console --disable-xwt test_cc1352.rscr | sed -e 's/WARNING//' | sed -e 's/sysbus//' | sed -e 's/non existing peripheral at//' | sed -e 's/ReadDoubleWord/R/' | sed -e 's/WriteDoubleWord/W/' | tee test_output.txt &
# TODO: find the name of the variable holding the last executed process background PID
#RENODE=$$
sleep 40
