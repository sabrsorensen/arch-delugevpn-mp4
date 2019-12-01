FROM binhex/arch-delugevpn
MAINTAINER sabrsorensen

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/sabrsorensen/arch-delugevpn-mp4.git" \
      org.label-schema.build-date=$BUILD_DATE

RUN \
  pacman -Syu --noconfirm && \
  pacman -S --needed --noconfirm \
        ffmpeg \
        gcc \
        git \
        python-pip && \
  pacman -Scc --noconfirm

RUN \
  pip install --no-cache-dir --upgrade \
        babelfish \
        deluge-client \
        gevent \
        'guessit<2' \
        pip \
        python-dateutil \
        qtfaststart \
        requests \
        requests-cache \
        requests[security] \
        stevedore==1.19.1 \
        'subliminal<2' \
        tmdbsimple && \
  git clone --depth 1 --single-branch --branch master git://github.com/mdhiggins/sickbeard_mp4_automator.git /sickbeard_mp4_automator/ && \
  chmod a+rwx -R /sickbeard_mp4_automator && \
  ln -s /downloads /data && \
  ln -s /config_mp4_automator/autoProcess.ini /sickbeard_mp4_automator/autoProcess.ini && \
  rm -rf /sickbeard_mp4_automator/post_process && \
  ln -sf /config_mp4_automator/post_process /sickbeard_mp4_automator/

VOLUME /config_mp4_automator
