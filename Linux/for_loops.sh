#!/bin/bash

states=("Maryland" "New York" "Pennsylvania" "Delaware" "Florida")

nums=(0 1 2 3 4 5 6 7 8 9)

for state in ${states[@]};
do
    if [ $state == "Hawaii" ]
    then
        echo "Hawaii is the best"
    else
        echo "Hawaii was not found"
    fi

done

for num in ${nums[@]};
do
    if [ $num == 3 ] || [ $num == 5 ] || [ $num == 7 ]
    then
        echo $num
    fi
done