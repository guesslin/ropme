FROM ubuntu:14.04
MAINTAINER guesslin1986@gmail.com

RUN apt-get update && \
    apt-get install -y build-essential gcc execstack


COPY ["./ropme", "/opt/ropme/"]

WORKDIR /opt/ropme/

RUN make clean dep all
RUN mkfifo pipe

EXPOSE 5555

ENTRYPOINT nc -l -p 5555 < pipe | setarch `arch` -R /opt/ropme/ropme >pipe
