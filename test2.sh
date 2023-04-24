#!/bin/bash
files=$(git diff main test/dbt --name-status |
while read status file; do
    if [[ $file =~ .*".sql" ]]; then
        if [[ $file =~ testpath.*"/" ]]; then
            file=${file##*/}
            file=${file::-4}
            if [ $status = "M" ]; then
                echo "dbt run --select $file+"
            elif [ $status = "A" ]; then
                echo "dbt run --select $file"
            fi
        fi
    fi
done |
paste -sd "," -
) 
echo $files
while read command; do
    echo "running:$command"
    # $command
done < <(echo "$files" | tr ',' '\n')


## Skapa upp en profiles.yml(OBS bara test i början)
## Bigquery key file
## Bigquery project
## Bigquery dedikerat dataset för test
## test-branch som man kan köra pull requests mot(om det går via dbt cloud?)
## skapa upp env variabler i github
## Skapa upp en profiles.yml