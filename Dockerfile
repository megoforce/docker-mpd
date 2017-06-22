FROM ubuntu:trusty
MAINTAINER Nat Lownes <nat.lownes@gmail.com>

RUN apt-get -qq update --fix-missing
RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y bash mpd
RUN apt-get -y install vorbis-tools libvorbis0a libvorbisenc2 libvorbisfile3 

ADD mpd.conf /etc/mpd.conf
ADD start.sh /home/mpd/start.sh

RUN mkdir -p /home/mpd/pids
RUN mkdir -p /home/mpd/logs
RUN chown -R mpd /home/mpd
RUN chmod +x /home/mpd/start.sh
EXPOSE 6600 8888 8889

ENTRYPOINT /home/mpd/start.sh
