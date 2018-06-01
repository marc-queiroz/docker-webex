#!/bin/sh

# uncomment to rebuild/build your webex docker image
#docker rm --force webex >/dev/null 2>&1
#docker build --tag=webex .

USER_UID=$(id -u)
USER_GID=$(id -g)
xhost "si:localuser:${USER}"

docker run --rm --name webex \
		-e "USER_UID=1000${USER_UID}" \
		-e "USER_GID=${USER_GID}" \
		-e "DISPLAY=unix${DISPLAY}" \
		-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		-v "/run/user/${USER_UID}/pulse:/run/pulse:ro" \
        -v /run/dbus/:/run/dbus/:rw \
        -v /dev/shm:/dev/shm \
		--device /dev/dri \
		webex
