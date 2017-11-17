#!/bin/bash

echo "Generating helptags"
echo

while IFS= read -r -d $'\0' docDir <&3; do
    echo "Generating helptags for '$docDir'..."

    vim -u NONE -c "helptags $docDir" -c q

    echo "[${?}] helptags for '$docDir' generated"
    echo
done 3< <(find bundle -iname "*doc" -type d -print0)
echo "Done..."
