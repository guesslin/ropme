FROM ubuntu:14.04
MAINTAINER guesslin1986@gmail.com

RUN apt-get update && \
    apt-get install -y build-essential gcc execstack nmap


COPY ["./ropme", "/opt/ropme/"]
COPY ["./flag", "/opt/flag"]

WORKDIR /opt/ropme/

RUN make clean dep all

EXPOSE 5555

ENTRYPOINT ncat -k -l -e "/usr/bin/setarch x86_64 -R /opt/ropme/ropme" 5555
