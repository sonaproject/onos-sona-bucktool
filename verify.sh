#!/bin/bash
BUCK=bin/buck

# run unit test for SONA apps
$BUCK test //apps/openstacknetworking/app:onos-apps-openstacknetworking-app-tests
$BUCK test //apps/openstacknode/app:onos-apps-openstacknode-app-tests
$BUCK test //apps/openstacknetworkingui/app:onos-apps-openstacknetworkingui-app-tests
$BUCK test //apps/openstacktelemetry/app:onos-apps-openstacktelemetry-app-tests
$BUCK test //apps/openstackvtap/app:onos-apps-openstackvtap-app-tests
$BUCK test //apps/openstacktroubleshoot/app:onos-apps-openstacktroubleshoot-app-tests
