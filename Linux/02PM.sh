#!/bin/bash

grep -h '02:00:00 PM' 0310_Dealer_schedule 0312_Dealer_schedule 0315_Dealer_schedule |awk '{print $1, $2, $5, $6}'

