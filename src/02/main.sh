#!/bin/bash
chmod +x ./save_file.sh
./save_file.sh
read -p "Do you want to save in to file? (y/n):" answer
    if [[ $answer == y || $answer == Y ]]
    then
        file="$(date +%d_%m_%y_%H_%M_%S).status"
        touch $file
        ./save_file.sh > $file
    else
        rm -rf *.status
    fi
