#!/usr/bin/env sh
# -*- coding: utf-8 -*-

# Do not edit or delete this file! When the `/restart` command is called,
# Minecraft tries to call the `start.sh` file in the root directory of the
# server folder. This is here so that the initalization script knows whether
# to restart the server or to stop and close the Docker container. Any content
# in this file will be overwritten when the Docker container is started.

touch ../.start-server
