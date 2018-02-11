FROM binhex/arch-delugevpn
MAINTAINER sabrsorensen

RUN \
    pacman -S --needed --noconfirm git python2 ffmpeg python2-setuptools python2-pip

RUN \
  pip2 install --upgrade pip && \
  pip2 install requests && \
  pip2 install requests[security] && \
  pip2 install requests-cache && \
  pip2 install babelfish && \
  pip2 install 'guessit<2' && \
  pip2 install 'subliminal<2' && \
  pip2 install stevedore==1.19.1 && \
  pip2 install python-dateutil && \
  pip2 install qtfaststart && \
  pip2 install deluge-client && \
  pip2 install gevent && \
  git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /sickbeard_mp4_automator/ && \
  touch /sickbeard_mp4_automator/info.log && \
  chmod a+rwx -R /sickbeard_mp4_automator && \
  ln -s /downloads /data && \
  ln -s /config_mp4_automator/autoProcess.ini /sickbeard_mp4_automator/autoProcess.ini

VOLUME /config_mp4_automator
