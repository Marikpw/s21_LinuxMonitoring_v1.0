#!/bin/bash

#Принимает 1 параметр при запуске и затем проверяет на наличие цифр

value="$1" #Сохранение значения, переданное в командной строке в переменную value
if [ -z "$value" ]; then #Проверка на пустой параметр
    echo "Вы не ввели текст"
else
    if [[ "$value" =~ ^[0-9]+$ ]]; then #проверка на число. Если число, то вывод ошибки (значения "1qwerty", "qwerty1" и пр. не входит в условие, так как это не число, а набор текстовых символов)
        echo "Неправильный ввод. Введите текстовый параметр."
    else
        echo "Введенный текст: $value"
    fi
fi