#!/bin/bash

MASTER_ONOS=02-master-onos
MASTER_ONOS_APPS=$MASTER_ONOS/apps
LOCAL_APPS=apps
BUCK_OUT=buck-out
SONA_OUT=sona-out
BUCK=bin/buck

rm -rf $LOCAL_APPS
mkdir -p $LOCAL_APPS

# copy sona apps into the separated directory
cp -R $MASTER_ONOS_APPS/openstacknetworking $LOCAL_APPS
cp -R $MASTER_ONOS_APPS/openstacknode $LOCAL_APPS
cp -R $MASTER_ONOS_APPS/openstacknetworkingui $LOCAL_APPS

# start to build sona and corresponding artifacts
$BUCK build onos

# copy SONA artifacts into the sona-out directory
rm -rf $SONA_OUT
mkdir -p $SONA_OUT
cp $BUCK_OUT/gen/apps/openstacknetworking/onos-apps-openstacknetworking-oar/app.oar $SONA_OUT/openstacknetworking.oar
cp $BUCK_OUT/gen/apps/openstacknode/onos-apps-openstacknode-oar/app.oar $SONA_OUT/openstacknode.oar
cp $BUCK_OUT/gen/apps/openstacknetworkingui/onos-apps-openstacknetworkingui-oar/app.oar $SONA_OUT/openstacknetworkingui.oar

# clean
# rm -rf $LOCAL_APPS
