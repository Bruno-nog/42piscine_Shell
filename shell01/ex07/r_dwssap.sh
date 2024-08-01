#!/bin/bash
 
cat /etc/passwd | \
grep -v '^#' | \
sed -n "${FT_LINE1},${FT_LINE2}p" | \
cut -d ':' -f 1 | \
rev | \
sort -r | \
awk 'NR % 2 == 0' | \
awk '{printf("%s, ", $0)}' | \
sed 's/, $/./' | \
tr -d '\n'
echo ""
