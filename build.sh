#!/bin/bash

MASTER_ONOS=master-onos/apps
LOCAL_APPS=apps
BUCK_OUT=buck-out
SONA_OUT=sona-out

rm -rf $LOCAL_APPS
mkdir -p $LOCAL_APPS

# copy sona apps into the separated directory
cp -R $MASTER_ONOS/openstacknetworking $LOCAL_APPS
cp -R $MASTER_ONOS/openstacknode $LOCAL_APPS
cp -R $MASTER_ONOS/openstacknetworkingui $LOCAL_APPS

# start to build sona and corresponding artifacts
bin/buck build onos

# copy SONA artifacts into the sona-out directory
# rm -rf $SONA_OUT
# mkdir -p $SONA_OUT
# cp $BUCK_OUT/gen/apps/openstacknetworking/onos-apps-openstacknetworking-oar/app.oar $SONA_OUT/openstacknetworking.oar
# cp $BUCK_OUT/gen/apps/openstacknode/onos-apps-openstacknode-oar/app.oar $SONA_OUT/openstacknode.oar
# cp $BUCK_OUT/gen/apps/openstacknetworkingui/onos-apps-openstacknetworkingui-oar/app.oar $SONA_OUT/openstacknetworkingui.oar

# clean
# rm -rf $LOCAL_APPS
