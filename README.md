# Artoo Adaptor For Pebble

This repository contains the Artoo (http://artoo.io/) adaptor for the Pebble smart watch (http://getpebble.com/). It uses the pebblewatch gem (https://github.com/hybridgroup/pebblewatch) to perform all communication.

Artoo is a open source micro-framework for robotics using Ruby.

For more information abut Artoo, check out our repo at https://github.com/hybridgroup/artoo

## Installing

```
gem install artoo-pebble
```

## Connecting to Pebble

This software requires version 1.11.1 of the Pebble watch firmware.

### Ubuntu

You will need to pair with the Pebble, and then you can find the Bluetooth address, for example `00:18:33:86:37:8B`. Once you know the address, you can use the rfcomm program to map a port to the device:

```
sudo rfcomm bind 0 00:18:33:86:37:8B 1
sudo chmod 666 /dev/rfcomm0
```
