FROM ubuntu:trusty
LABEL maintainer="Marc Queiroz<marc.queiroz at gmail>"
ENV DEBIAN_FRONTEND noninteractive
RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install nano wget openssh-server -y && \
    apt-get install libcurl3:i386 -y && \
    apt-get install firefox:i386 icedtea-7-plugin:i386 openjdk-7-jre:i386 -y && \
    apt-get install libgtk2.0-0:i386 libpangoxft-1.0-0:i386 libpangox-1.0-0:i386 libxmu6:i386 libxtst6:i386 libdbus-glib-1-2:i386 -y && \
    apt-get install lib32stdc++6 libasound2 -y && \
    apt-get install -y libpulse0:i386 pulseaudio:i386 && \
    localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || true && \
    echo root:root | chpasswd &&\
    mkdir /root/.ssh && \
    mkdir /var/run/sshd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo 'X11UseLocalhost no' >> /etc/ssh/sshd_config
RUN useradd -ms /bin/bash webex
USER webex
WORKDIR /home/webex
CMD /usr/bin/firefox
