FROM eclipse-temurin:17-jre as multipaper-master

ENV MULTIPAPER_MASTER_JAR_URL=http://185.185.126.240:9000/public-bucket/MultiPaper-Master-2.8.8-all.jar
ENV MULTIPAPER_MASTER_PORT=25585 MULTIPAPER_MASTER_PROXY_PORT=25565

ADD $MULTIPAPER_MASTER_JAR_URL /opt/multipaper-master/multipaper-master.jar

CMD java -jar /opt/multipaper-master/multipaper-master.jar $MULTIPAPER_MASTER_PORT $MULTIPAPER_MASTER_PROXY_PORT


FROM eclipse-temurin:17-jre as multipaper-server

ENV MULTIPAPER_SERVER_JAR_URL=http://185.185.126.240:9000/public-bucket/MultiPaper-paperclip-1.19-R0.1-SNAPSHOT-reobf.jar
ENV ENABLE_NAME_GENERATION=true MULTIPAPER_BUNGEECORD_NAME="server1" MULTIPAPER_MASTER_ADDRESS=127.0.0.1:25585 VIEW_DISTANCE=16 PROXY_PROTOCOL=false

ADD $MULTIPAPER_SERVER_JAR_URL /opt/multipaper-server/multipaper-server.jar
RUN apt update && apt install -y --no-install-recommends uuid-runtime
COPY ./multipaper-server-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]