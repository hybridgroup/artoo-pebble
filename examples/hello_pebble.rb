require 'artoo'

connection :pebble, :adaptor => :pebble, :port => "/dev/rfcomm0", :id => "378B"
device :watch, :driver => :pebble
  
work do
  watch.set_nowplaying_metadata("Artoo", "Hello", Time.now.to_s)
  every(5.seconds) do
    watch.set_nowplaying_metadata("Artoo", "Update...", Time.now.to_s)
  end
end
