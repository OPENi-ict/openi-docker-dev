#!/bin/sh

node /dao/lib/local-runner.js &
node /communications/lib/local-runner.js &
node /notifications/lib/local-runner.js &
node /auth-api/lib/local-runner.js &
node /attachment-api/lib/local-runner.js &
node /object-api/lib/local-runner.js &
node /permissions_api/lib/local-runner.js &
node /swagger-def/lib/local-runner.js &
node /cloudlet-api/lib/local-runner.js &
node /search_api/lib/local-runner.js &
node /type-api/lib/local-runner.js &
cd /mongrel2/ && bash start_mongrel2.sh






