
=========
TVHeadend
=========

Server for PVR

usb dvb-t tuner
===============

https://tvheadend.org/projects/tvheadend/wiki/AptRepository

curl http://apt.tvheadend.org/repo.gpg.key | sudo apt-key add -
apt-add-repository -r http://apt.tvheadend.org/stable
apt-add-repository http://apt.tvheadend.org/unstable
apt-get update

apt-get update
apt-get install tvheadend
apt-get install kodi-pvr-tvheadend-hts v4l-conf v4l-utils dvb-tools w-scan

install tvb-t device firmware if necessary

tvheadend ui - http://localhost:9981/

Read More
---------

* https://tvheadend.org/