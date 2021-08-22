#!/bin/bash

mkdir -p ~/backups/{freemem,diskuse,openlist,freedisk}

echo -e "Free memory on system: /n $(free -m)"  >> ~/backups/freemem/free_mem.txt

echo -e  "Free disk usage: /n $(df -h)" >> ~/backups/diskuse/disk_usage.txt

echo -e "Open files: /n $(ps aux)" >> ~/backups/openlist/open_list.txt

echo -e "File system disk space: /n $(df -h)" >> ~/backups/freedisk/free_disk.txt 
