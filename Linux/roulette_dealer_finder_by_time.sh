#!/bin/bash

cat $1_Dealer_schedule |grep "$2:00:00 $3" |awk '{print $1, $2, $5, $6}' 
