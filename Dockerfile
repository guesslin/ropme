FROM ubuntu:14.04
MAINTAINER guesslin1986@gmail.com

RUN apt-get update && \
    apt-get install -y build-essential gcc execstack

EXPOSE 5555

ENTRYPOINT ["nc -l -p 5555| setarch `arch` -R /path/to/ropme"]
