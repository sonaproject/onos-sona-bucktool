#!/bin/bash
BUCK=bin/buck

# run unit test for openstacknetworking
$BUCK test //apps/openstacknetworking/app:onos-apps-openstacknetworking-app-tests

# run unit test for openstacknode
$BUCK test //apps/openstacknode/app:onos-apps-openstacknode-app-tests
