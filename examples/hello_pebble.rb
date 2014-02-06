require 'artoo'

connection :pebble, :adaptor => :pebble
device :watch, :driver => :pebble

work do
  c = 100
  every(1.second) do
    c++
    str = "c: \#{c}"
    pebble.message_queue.push(str)
    Logger.info(pebble.last_message)
  end
end
