require 'artoo'

connection :pebble, :adaptor => :pebble
device     :watch,  :driver  => :pebble, :name => 'pebble'

api :host => '0.0.0.0', :port => '8080'

name 'pebble'

def button_push(*data)
  unless data[1].nil?
    p "#{data[1]} button pushed"
  end
end

work do
  pebble.send_notification("Hello Pebble!")
  on pebble, :button => :button_push
end
