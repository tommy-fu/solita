#!/bin/bash
files=$(git diff main test/dbt --name-status |
while read status file; do
    if [[ $file =~ .*".sql" ]]; then
        if [ $status = "??" ] || [ $status = "M" ] || [ $status = "A" ]; then
            echo "dbt run --select ${file::-4}+"
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