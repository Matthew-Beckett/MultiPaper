#!/bin/bash
if [ -n "$MULTIPAPER_WORLD_HYDRATION_URL" ];
then
    echo "Hydrating worlds from $MULTIPAPER_WORLD_HYDRATION_URL"
    wget -O /tmp/worlds.tar.xz "$MULTIPAPER_WORLD_HYDRATION_URL"
    tar -xf /tmp/worlds.tar.xz -C /opt/multipaper-master
fi


echo "Starting multipaper-master instance on port $MULTIPAPER_MASTER_PORT with proxy on $MULTIPAPER_MASTER_PROXY_PORT"
cd /opt/multipaper-master
java -jar ./multipaper-master.jar "$MULTIPAPER_MASTER_PORT" "$MULTIPAPER_MASTER_PROXY_PORT"