#!/bin/bash

SETTINGS_FILE="~/.kanecta/deploy-settingsX.sh"

if [ ! -f "$SETTINGS_FILE" ]; then
cat << EOF

Can't find settings file at: $SETTINGS_FILE

Please create a settings file with the following content:

----------------------

SERVER="some_server"
DEPLOY_PATH="/directory/public/"

----------------------

EOF
exit 1
fi

set -x

source $SETTINGS_FILE

./build.sh
cd dist
mv index.html docs.html
ls
rsync -av * "$SERVER:$DEPLOY_PATH"