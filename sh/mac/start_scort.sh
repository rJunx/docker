#!/usr/bin/env bash

echo "Start socat..."

socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"