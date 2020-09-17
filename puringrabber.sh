#!/bin/sh
#set -o xtrace
test -z $1 && exit 1
mkdir videos || exit 2
while IFS=',' read -r id description link; do
 # proceed only if the id field is not "id"
 if test $id != id; then
  printf "Downloading video number %i and saving it as %s\n" \
   $id "$description".mp4
  curl -# -o videos/"$description".mp4 $link
 fi
done < "$1"
