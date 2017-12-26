#!/bin/bash
cd $(dirname $0)
pacman -Qet | grep -Po "^([^ ]+)" > installed_packages.txt
