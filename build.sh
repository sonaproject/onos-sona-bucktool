#!/bin/bash

STABLE_ONOS=01-stable-onos
MASTER_ONOS=02-master-onos
MASTER_ONOS_APPS=$MASTER_ONOS/apps
LOCAL_APPS=apps
BUCK_OUT=buck-out
SONA_OUT=sona-out
BUCK=bin/buck
BASH_PROFILE=tools/dev/bash_profile

source $BASH_PROFILE

rm -rf $LOCAL_APPS
mkdir -p $LOCAL_APPS

# copy onos.def from stable source
cp $STABLE_ONOS/onos.defs ./

# copy sona apps into the separated directory
cp -R $MASTER_ONOS_APPS/openstacknetworking $LOCAL_APPS
cp -R $MASTER_ONOS_APPS/openstacknode $LOCAL_APPS
cp -R $MASTER_ONOS_APPS/openstacknetworkingui $LOCAL_APPS
cp -R $MASTER_ONOS_APPS/openstacktelemetry $LOCAL_APPS
cp -R $MASTER_ONOS_APPS/openstackvtap $LOCAL_APPS
cp -R $MASTER_ONOS_APPS/openstacktroubleshoot $LOCAL_APPS

# replace broken deps
sed -i 's/com_google_code_gson_gson/gson/g' $LOCAL_APPS/openstacktelemetry/BUCK

# start to build sona and corresponding artifacts
$BUCK build onos

# copy SONA artifacts into the sona-out directory
rm -rf $SONA_OUT
mkdir -p $SONA_OUT
cp $BUCK_OUT/gen/apps/openstacknetworking/onos-apps-openstacknetworking-oar/app.oar $SONA_OUT/openstacknetworking.oar
cp $BUCK_OUT/gen/apps/openstacknode/onos-apps-openstacknode-oar/app.oar $SONA_OUT/openstacknode.oar
cp $BUCK_OUT/gen/apps/openstacknetworkingui/onos-apps-openstacknetworkingui-oar/app.oar $SONA_OUT/openstacknetworkingui.oar
cp $BUCK_OUT/gen/apps/openstacktelemetry/onos-apps-openstacktelemetry-oar/app.oar $SONA_OUT/openstacktelemetry.oar
cp $BUCK_OUT/gen/apps/openstackvtap/onos-apps-openstackvtap-oar/app.oar $SONA_OUT/openstackvtap.oar
cp $BUCK_OUT/gen/apps/openstacktroubleshoot/onos-apps-openstacktroubleshoot-oar/app.oar $SONA_OUT/openstacktroubleshoot.oar
