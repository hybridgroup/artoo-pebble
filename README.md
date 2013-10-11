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

connection :pebble, :adaptor => :pebble, :port => "127.0.0.1:4567", :id => "378B"
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

### OSX

The main steps are:
- Pair your computer and the Pebble
- Use a socket to serial connection to map a TCP socket to the local port
- Connect to the device via Artoo

To figure out which port your pebble is connected to, use the `artoo connect scan` command:

```
$ artoo connect scan
```

Now you are ready to connect to the Sphero using the socket, in this example port 4567:

```
artoo connect serial pebble 4567
```

### Ubuntu

The main steps are:
- Pair your computer and the Pebble
- Map your device to a port
- Use a socket to serial connection to map a TCP socket to the local port
- Connect to the device via Artoo

You will need to pair with the Pebble, entering any needed password.

Then you can find the Bluetooth address, for example `00:18:33:86:37:8B`, by using the `artoo connect scan` command:

```
$ artoo connect scan
```

Once you know the address, you can use the `artoo connect bind` command to map a port to the device:

```
artoo connect bind 00:18:33:86:37:8B pebble
```

Now you are ready to connect to the Pebble using a socket, in this example port 4567:

```
artoo connect serial pebble 4567
```

### Windows

We are currently working with the Celluloid team to add Windows support. Please check back soon!
