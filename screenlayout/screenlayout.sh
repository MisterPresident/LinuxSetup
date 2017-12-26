#!/bin/bash
DEVICES=$(find /sys/class/drm/*/status)
if [ -n "$1" ]; then
  {
    while read l
    do
      dir=$(dirname $l);
      status=$(cat $l);
      dev=$(echo $dir | cut -d\- -f 2-);

      if [ $(expr match  $dev "HDMI") != "0" ]
      then
        dev=HDMI${dev#HDMI-?-}
      else
        dev=$(echo $dev | tr -d '-')
      fi

      if [ "connected" == "$status" ]
      then
        declare $dev="yes";
      fi
    done <<< "$DEVICES"


    if [ ! -z "$HDMI1" ]
    then
      OK=2
    else
      OK=1
    fi
    COUNT=0
    while [ $COUNT -ne $OK ] ; do
      COUNT=$(($(hwinfo --monitor --short | wc -l) - 1))
      sleep 1
    done
    $0
  } >> /tmp/monitor.out & disown
  exit 0 
fi

cd $(dirname "$0")

displaynum=`ls /tmp/.X11-unix/* | sed s#/tmp/.X11-unix/X##`
display=":$displaynum.0"

export DISPLAY=":$displaynum.0"
export XAUTHORITY=$(ps -C Xorg -f --no-header | sed -n 's/.*-auth //; s/ -[^ ].*//; p')




MONITORS=$(hwinfo --monitor --short)
# echo "$MONITORS"
COUNT=$(($(echo "$MONITORS" | wc -l) - 1))
# echo $COUNT

echo $MONITORS | grep "LG ELECTRONICS L246WH" > /dev/null
ROHRBACH=$?
echo $MONITORS | grep "BenQ V2400W" > /dev/null
GRAZ=$?

if [ $COUNT -eq 2 ]; then
  echo "External monitors are plugged in"
  if [ $ROHRBACH -eq 0 ]; then
    LAYOUT="Rohrbach"
    FILE="./screenlayout_rohrbach.sh"
  elif [ $GRAZ -eq 0 ]; then
    LAYOUT="Graz"
    FILE="./screenlayout_graz.sh"
  else
    LAYOUT="Other"
    FILE="arandr"
  fi
else
  echo "No external monitors are plugged in"
  LAYOUT="Laptop"
  FILE="./screenlayout_basic.sh"
fi

echo "Use 'layout $LAYOUT', exec $FILE"
$FILE &
