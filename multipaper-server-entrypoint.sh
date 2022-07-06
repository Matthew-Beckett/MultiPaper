#!/bin/bash
if [ "$ENABLE_NAME_GENERATION" = false ];
then
    export MULTIPAPER_BUNGEECORD_NAME="$(uuidgen)"
fi


echo "Starting multipaper-server instance with name $MULTIPAPER_BUNGEECORD_NAME"
java -Dcom.mojang.eula.agree="$ACCEPT_EULA" -DbungeecordName="$MULTIPAPER_BUNGEECORD_NAME" -DmultipaperMasterAddress="$MULTIPAPER_MASTER_ADDRESS" -Dproperties.view-distance="$VIEW_DISTANCE" -jar /opt/multipaper-server/multipaper-server.jar