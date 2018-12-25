FROM trasba/baseimage-ubuntu-x64:cosmic

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="trasba"

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get upgrade -y && \
 apt-get install --no-install-recommends -y prosody \
	mercurial && \
 echo "**** download prosody-filer ****" && \
 curl -L https://github.com/ThomasLeister/prosody-filer/releases/download/v1.0.0-rc3/prosody-filer_v1.0.0-rc3_linux_x64.0_linux_x64 --output prosody-filer && \
 hg clone https://hg.prosody.im/prosody-modules/ /usr/lib/prosody/modules/prosody-modules && \
 echo "**** cleanup ****" && \
 apt-get purge -y mercurial && \
 apt-get autoremove -y && \
 apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 5222 5269 5280 5050
VOLUME /config
