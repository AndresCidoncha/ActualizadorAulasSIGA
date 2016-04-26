#!/bin/bash

echo $1 | sudo su
apt-get update
dpkg --configure -a
apt-get install -f --yes
apt-get dist-upgrade --yes
