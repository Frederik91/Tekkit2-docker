FROM openjdk:8-jre-slim-buster

WORKDIR /minecraft

RUN apt-get update \
	&& apt-get install -y --no-install-recommends curl unzip\
	&& curl https://servers.technicpack.net/Technic/servers/tekkit-2/Tekkit-2_Server_v1.2.1.zip -o tekkit_server.zip \
	&& unzip tekkit_server.zip \
	&& rm tekkit_server.zip \
	&& chmod +x LaunchServer.sh

COPY eula.txt eula.txt

ENV EULA=True

EXPOSE 25565/udp
EXPOSE 25565/tcp

CMD ["./LaunchServer.sh"]