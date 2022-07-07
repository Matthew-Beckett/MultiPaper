#!/bin/bash
if [ "$ENABLE_NAME_GENERATION" = true ];
then
    export MULTIPAPER_BUNGEECORD_NAME="$(uuidgen)"
fi


echo "Starting multipaper-server instance with name $MULTIPAPER_BUNGEECORD_NAME"
cd /opt/multipaper-server
java -Dcom.mojang.eula.agree="$ACCEPT_EULA" -DbungeecordName="$MULTIPAPER_BUNGEECORD_NAME" -DmultipaperMasterAddress="$MULTIPAPER_MASTER_ADDRESS" -Dproperties.view-distance="$VIEW_DISTANCE" -jar ./multipaper-server.jar