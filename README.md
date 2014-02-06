# Artoo Adaptor For Pebble

This repository contains the Artoo (http://artoo.io/) adaptor and driver for the Pebble smart watch (http://getpebble.com/). It uses the Pebble 2.0 SDK, and requires the 2.0 iOS or Android app, and that the "Chomps" app (https://github.com/hybridgroup/chomps) has been installed on the Pebble watch.

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

connection :pebble, :adaptor => :pebble
device :watch, :driver => :pebble

work do
  c = 100
  every 1.second do
    c++
    str = "c: \#{c}"
    pebble.message_queue.push(str)
    Logger.info(pebble.last_message)
  end
end
```

## Connecting to Pebble

Communication between the Pebble watch and Artoo takes place entirely using the Artoo API. This adaptor uses the Pebble 2.0 SDK, and requires the 2.0 iOS or Android app, and that the "Chomps" app (https://github.com/hybridgroup/chomps) has been installed on the Pebble watch.

## Documentation

Check out our [documentation](http://artoo.io/documentation/) for lots of information about how to use Artoo.

## IRC

Need more help? Just want to say "Hello"? Come visit us on IRC freenode #artoo

## Contributing

* All patches must be provided under the Apache 2.0 License
* Please use the -s option in git to "sign off" that the commit is your work and you are providing it under the Apache 2.0 License
* Submit a Github Pull Request to the appropriate branch and ideally discuss the changes with us in IRC.
* We will look at the patch, test it out, and give you feedback.
* Avoid doing minor whitespace changes, renamings, etc. along with merged content. These will be done by the maintainers from time to time but they can complicate merges and should be done seperately.
* Take care to maintain the existing coding style.
* Add unit tests for any new or changed functionality.
* All pull requests should be "fast forward"
  * If there are commits after yours use “git rebase -i <new_head_branch>”
  * If you have local changes you may need to use “git stash”
  * For git help see [progit](http://git-scm.com/book) which is an awesome (and free) book on git


(c) 2012-2014 The Hybrid Group
