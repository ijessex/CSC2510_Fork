#!bin/bash

find /home/$(whoami)/bin/ -name "c*"
find /home/$(whoami)/bin/ -name "*sh*" -type l
find /home/$(whoami) | head
grep -h "model name" /proc/cpuinfo
grep -v -c "sudo" /etc/services
grep -n -w "sudo" /etc/services
export LC_ALL=C
sort "food"
sort -r "food"
sort -k2 "food"
sort -o "calo" -k4 -k3 -nr "food"

#comment
