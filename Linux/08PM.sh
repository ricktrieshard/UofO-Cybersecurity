#!/bin/bash

grep -h '08:00:00 PM' 0310_Dealer_schedule |awk '{print $1, $2, $5, $6}'

#cat $1_Dealer_schedule

