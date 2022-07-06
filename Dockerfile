FROM eclipse-temurin:17-jre as multipaper-master
ENV MULTIPAPER_MASTER_JAR_URL=http://185.185.126.240:9000/public-bucket/MultiPaper-Master-2.8.8-all.jar
ENV MULTIPAPER_MASTER_PORT=25585
ADD $MULTIPAPER_MASTER_JAR_URL /opt/multipaper-master/multipaper-master.jar
CMD java -jar /opt/multipaper-master/multipaper-master.jar $MULTIPAPER_MASTER_PORT

FROM eclipse-temurin:17-jre as multipaper-server
ENV MULTIPAPER_SERVER_JAR_URL=http://185.185.126.240:9000/public-bucket/MultiPaper-paperclip-1.19-R0.1-SNAPSHOT-reobf.jar
ENV MULTIPAPER_BUNGEECORD_NAME=server1 MULTIPAPER_MASTER_ADDRESS=127.0.0.1:25585 VIEW_DISTANCE=16 PROXY_PROTOCOL=false
ADD $MULTIPAPER_SERVER_JAR_URL /opt/multipaper-server/multipaper-server.jar
CMD java -DbungeecordName=$MULTIPAPER_BUNGEECORD_NAME -DmultipaperMasterAddress=$MULTIPAPER_MASTER_ADDRESS -Dproperties.view-distance=$VIEW_DISTANCE -jar /opt/multipaper-server/multipaper-server.jar
