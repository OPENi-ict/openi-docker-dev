#!/bin/bash

SCRIPT_ROOT_DIR=/opt/openi/provision/

cd $SCRIPT_ROOT_DIR
. /opt/openi/provision/core/cloudlet_framework_provision.sh
cd $SCRIPT_ROOT_DIR
. /opt/openi/provision/core/api_framework_provision.sh
cd $SCRIPT_ROOT_DIR
. /opt/openi/provision/core/security_framework_provision.sh
cd $SCRIPT_ROOT_DIR
#. /opt/openi/provision/core/sdk_framework_provision.sh
cd $SCRIPT_ROOT_DIR
#. /opt/openi/provision/core/monitoring_provision.sh


sudo sh /opt/openi/utils/create_sym_links.sh

sudo sh /opt/openi/utils/tmux_openi.sh &

cd /opt/openi/repos/mongrel2/

sudo sh /opt/openi/repos/mongrel2/start_mongrel2.sh

sudo node /opt/openi/repos/cloudlet-platform/lib/main.js &

until $(curl --output /dev/null --silent --head --fail https://localhost/api/v1/types); do
    printf '.'
    sleep 5
done

sudo sh /opt/openi/utils/populate_default_types.sh

sudo sh /opt/openi/utils/populate_couchbase_views.sh

#sudo sh /opt/openi/utils/generate_api_clients.sh dev.openi-ict.eu

bash