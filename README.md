# docker-webex
Docker Webex - Run webex enable browser with pulseaudio enable capabilities.

# host prerequisites

Need to install paprefs - A simple GTK-based configuration dialog for PulseAudio

Then you need to enable network access inside your /etc/pulse/default.pa,
uncomment this two modules, module-native-protocol-tcp and
module-zeroconf-publish. 


```bash
### Network access (may be configured with paprefs, so leave this commented
### here if you plan to use paprefs)
#load-module module-esound-protocol-tcp
load-module module-native-protocol-tcp
load-module module-zeroconf-publish
```

Enable your avahi daemon service, for service discovery

```bash
sudo systemctl start avahi-daemon.service
```

You need to restart pulseaudio service.

```bash
pulseaudio -k
pulseaudio --start
```

Open your paprefs application.

```bash
$paprefs
```

In network access tab enable *Make discoverable PulseAudio netwrok sound
devices available locally*

In network server tab enable *Enable network access to local sound devices*.

If you find any problems using pulseaudio from Firefox docker instance, try to
open some video at youtube.com to test. Maybe you need to check the other two
options, *allow other machines on the LAN to discover local sound devices* and
*don't require authentication*.


# docker build command
## Inside the repository execute the command on shell

```bash
$docker build --tag=webex .
```

# run browser
## Execute the command on shell

```bash
$./webex.sh
```
# Acknolodgement and thanks to other dockers related repositories at github
I would like to thank the owners of this repositories for providing great inspiration for my own version of docker webex for linux.

[docker-webex](https://github.com/fgsch/docker-webex)

[webex-docker](https://github.com/diyan/webex-docker)

[Pulseaudio configs](https://github.com/yohanakh/webex-docker)
