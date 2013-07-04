# Artoo Adaptor For Pebble

This repository contains the Artoo (http://artoo.io/) adaptor for the Pebble smart watch (http://getpebble.com/). It uses the pebblewatch gem (https://github.com/hybridgroup/pebblewatch) to perform all communication.

Artoo is a open source micro-framework for robotics using Ruby.

For more information abut Artoo, check out our repo at https://github.com/hybridgroup/artoo

[![Code Climate](https://codeclimate.com/github/hybridgroup/artoo-pebble.png)](https://codeclimate.com/github/hybridgroup/artoo-pebble) [![Build Status](https://travis-ci.org/hybridgroup/artoo-pebble.png?branch=master)](https://travis-ci.org/hybridgroup/artoo-pebble)

## Installing

```
gem install artoo-pebble
```

## Using

```ruby
require 'artoo'

connection :pebble, :adaptor => :pebble, :port => "/dev/rfcomm0", :id => "378B"
device :watch, :driver => :pebble

def button_push(*data)
  puts data[1].button unless data[1].nil?
end

work do
  on watch, :media_control => :button_push

  watch.set_nowplaying_metadata("Artoo", "Hello", Time.now.to_s)
  every(5.seconds) do
    watch.set_nowplaying_metadata("Artoo", "Update...", Time.now.to_s)
  end
end
```

## Connecting to Pebble

This software requires version 1.12.0 of the Pebble watch firmware.

### Ubuntu

You will need to pair with the Pebble, and then you can find the Bluetooth address, for example `00:18:33:86:37:8B`. Once you know the address, you can use the rfcomm program to map a port to the device:

```
sudo rfcomm bind 0 00:18:33:86:37:8B 1
sudo chmod 666 /dev/rfcomm0
```
