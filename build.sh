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

# copy BUCK build script
cp $STABLE_ONOS_APPS/openstacknetworking/BUCK $LOCAL_APPS/openstacknetworking
cp $STABLE_ONOS_APPS/openstacknetworking/api/BUCK $LOCAL_APPS/openstacknetworking/api
cp $STABLE_ONOS_APPS/openstacknetworking/app/BUCK $LOCAL_APPS/openstacknetworking/app

cp $STABLE_ONOS_APPS/openstacknode/BUCK $LOCAL_APPS/openstacknode
cp $STABLE_ONOS_APPS/openstacknode/api/BUCK $LOCAL_APPS/openstacknode/api
cp $STABLE_ONOS_APPS/openstacknode/app/BUCK $LOCAL_APPS/openstacknode/app

cp $STABLE_ONOS_APPS/openstacknetworkingui/BUCK $LOCAL_APPS/openstacknetworkingui
cp $STABLE_ONOS_APPS/openstacknetworkingui/api/BUCK $LOCAL_APPS/openstacknetworkingui/api
cp $STABLE_ONOS_APPS/openstacknetworkingui/app/BUCK $LOCAL_APPS/openstacknetworkingui/app

cp $STABLE_ONOS_APPS/openstacktelemetry/BUCK $LOCAL_APPS/openstacktelemetry
cp $STABLE_ONOS_APPS/openstacktelemetry/api/BUCK $LOCAL_APPS/openstacktelemetry/api
cp $STABLE_ONOS_APPS/openstacktelemetry/app/BUCK $LOCAL_APPS/openstacktelemetry/app

cp $STABLE_ONOS_APPS/openstackvtap/BUCK $LOCAL_APPS/openstackvtap
cp $STABLE_ONOS_APPS/openstackvtap/api/BUCK $LOCAL_APPS/openstackvtap/api
cp $STABLE_ONOS_APPS/openstackvtap/app/BUCK $LOCAL_APPS/openstackvtap/app

cp $STABLE_ONOS_APPS/openstacktroubleshoot/BUCK $LOCAL_APPS/openstacktroubleshoot
cp $STABLE_ONOS_APPS/openstacktroubleshoot/api/BUCK $LOCAL_APPS/openstacktroubleshoot/api
cp $STABLE_ONOS_APPS/openstacktroubleshoot/app/BUCK $LOCAL_APPS/openstacktroubleshoot/app

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
