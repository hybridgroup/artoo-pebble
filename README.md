# Artoo Adaptor For Pebble

This repository contains the Artoo (http://artoo.io/) adaptor for the Pebble smart watch (http://getpebble.com/). It uses the Pebble 2.0 SDK, and requires the 2.0 iOS or Android app, and that the "Chomps" app (https://github.com/hybridgroup/chomps) has been installed on the Pebble watch.

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

api :port => "127.0.0.1:8080"
connection :pebble, :adaptor => :pebble
device :watch, :driver => :pebble

work do
  @c = 100
  every(1.second) do
    @c++
    str = "c: #{c}"
    pebble.message_queue().push(str)
    Logger.info(pebble.last_message())
  end
end
```

## Connecting to Pebble

This software requires version 1.12.0 of the Pebble watch firmware.

### OSX

The main steps are:
- Pair your phone and the Pebble
- Install the "Chomps" app on the Pebble watch (https://github.com/hybridgroup/chomps)
- Connect to the phone/watch via Artoo

### Ubuntu

The main steps are:
- Pair your phone and the Pebble
- Install the "Chomps" app on the Pebble watch (https://github.com/hybridgroup/chomps)
- Connect to the phone/watch via Artoo

### Windows

We are currently working with the Celluloid team to add Windows support. Please check back soon!
