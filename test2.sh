#!/bin/bash
files=$(git status --porcelain)
while read -r line; do
    STATUS=$(echo $line | cut -d " " -f 1);
    FILE=$(echo $line | cut -d " " -f 2);
    echo $FILE$STATUS
    if [[ $FILE =~ .*".sql" ]]; then
        echo "It's there."
        if [ $STATUS = "??" ] || [ $STATUS = "M" ] || [ $STATUS = "A" ]; then
            echo "dbt run --select ${FILE::-4}+"
        fi
fi
done <<< $files

# declare -A test

# while read -r line; do 
#     STATUS=$(echo $line | cut -d " " -f 1);
#     FILE=$(echo $line | cut -d " " -f 2);
#     test[name]=$FILE;
#     test[status]=$STATUS;
#     echo ${test[status]}
#     echo ${test[name]}
#     echo ${test}
#     array+=($test)
# done < test.txt
# echo ${array[*]}