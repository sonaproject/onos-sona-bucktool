#!/bin/bash

# run unit test for openstacknetworking
bin/buck test //apps/openstacknetworking/app:onos-apps-openstacknetworking-app-tests

# run unit test for openstacknode
bin/buck test //apps/openstacknode/app:onos-apps-openstacknode-app-tests
