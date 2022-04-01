#!/bin/bash
echo "A Quick System Audit CScript"
echo -e "_________________________________"
date
echo "Machine Type Info:\n"
echo $MACHTYPE
echo -e "uname info: $(uname -a) "
echo -e "IP Info: $(ip addr | head 09 | tail -1) "
echo -e "Hostname: $(hostname -s) "