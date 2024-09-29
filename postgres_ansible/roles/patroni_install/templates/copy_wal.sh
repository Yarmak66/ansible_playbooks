#!/bin/bash

FULL="$1"
NAME="$2"
PREF=`date +%Y`/`date +%m`/`date +%d`
CMD="pigz -1 -p40 -c ${FULL} > /mnt/backup/wals/${NAME}.gz"
echo "$CMD"  >> /var/log/postgresql/copy_wal.log

# Убедимся, что директория существует
mkdir -p /mnt/backup/wals


# Выполняем команду сжатия и сохранения файла локально
eval $CMD