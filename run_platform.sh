#!/bin/sh

node /repos/dao/lib/local-runner.js &
node /repos/communications/lib/local-runner.js &
node /repos/notifications/lib/local-runner.js &
node /repos/auth-api/lib/local-runner.js &
node /repos/attachment-api/lib/local-runner.js &
node /repos/object-api/lib/local-runner.js &
node /repos/permissions_api/lib/local-runner.js &
node /repos/swagger-def/lib/local-runner.js &
node /repos/cloudlet-api/lib/local-runner.js &
node /repos/search_api/lib/local-runner.js &
node /repos/type-api/lib/local-runner.js &
cd /repos/mongrel2/ && bash start_mongrel2.sh






