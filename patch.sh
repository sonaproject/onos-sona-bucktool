#!/bin/bash

STABLE_ONOS=01-stable-onos
ONOS_PATCH=03-onos-patch

if [ -z "$1" ]
  then
    echo "Error: need to specify ONOS version numnber!"
    exit 1
fi

cp $ONOS_PATCH/$1/*.patch $STABLE_ONOS
cd $STABLE_ONOS

git config --global user.email "sona@onosproject.com"
git config --global user.name "SONA Project"

for entry in *.patch
do
  echo "Patching ONOS with the patch $entry..."
  git am -3 < $entry
done

echo "Done all patches!"
