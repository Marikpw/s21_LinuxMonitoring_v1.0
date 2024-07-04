#!/bin/bash

#Проверка на ввод пути папки

if ! [ $# -eq 1 ]
then
echo "Нужно прописать путь к папке";
    exit 1
fi

#__________________

#Проверка на то, чтобы пользователь в конце прописал /

if ! [[ $1 == */ ]]
then
    echo "В конце должен использоваться /"
    exit 1
fi

    start_time=$(date +%s)
#Команда find ищет файлы в директории,команда wc -l подсчитывает количество строк в выводе.-type d означает, что команда будет искать только директории.
    echo -e "Total number of folders (including all nested ones) = $(sudo find $1 -type d | wc -l)"
    
#__________________
    
#Эта команда выводит последние 5 записей из результата выполнения команды du для переданного параметра $1 в формате:
    #Номер записи - имя файла/каталога, размер в килобайтах
    echo -e  "TOP 5 folders of maximum size arranged in descending order (path and size):"
    echo $(du -c $1 | sort -rh | tail -n 5| awk '{print NR" - " $2 "/, " $1"K"}')

#__________________

#Команда cat -n выводит содержимое файла с нумерацией строк.
    echo "etc up to = $(sudo du -Sh $1 | sort -rh | head -5 | cat -n | awk '{print $1" - "$3", "$2}')"
#__________________
#Kоманда wc -l подсчитывает количество строк в выводе, -type f означает, что будут выведены только файлы
    echo "Total number of files =$(sudo find "$1" -type f | wc -l)"
#__________________
    echo "Number of:"
# -name "*.conf" ищутся все файлы с расширением .conf(.txt, .rar, .log, .zip,) в текущей директории.
    echo "Configuration files (with the .conf extension) = $(sudo find "$1" -type f -name "*.conf" | wc -l)"
    echo "Text files = $(sudo find "$1" -type f -name "*.txt" | wc -l)"
    echo "Executable files = $(sudo find "$1" -type f -executable | wc -l)"
    echo "Log files (with the extension .log) = $(sudo find "$1" -type f -name "*.log" | wc -l)"
    echo "Archive files = $(sudo find "$1" -type f -name "*.zip" -or -name "*.rar" | wc -l)"
    echo "Symbolic links = $(sudo find "$1" -type l | wc -l)"
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type): = $(sudo find $1 -type f -exec du -Sh {} + | sort -rh | head -10 | cat -n | awk '{print $1" - "$3", "$2}')"
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file) = $(sudo find $1 -type f -exec du -h {} + | sort -hr | head -10 | cat -n | awk '{print $1" - "$3", "$2}')"
    end_time=$(date +%s)
    #рассчет времени выполнения скрипта
    echo "Script execution time: $(($end_time - $start_time)) seconds"
