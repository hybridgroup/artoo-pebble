require 'artoo'

connection :pebble, :adaptor => :pebble
device     :watch,  :driver  => :pebble, :name => 'pebble'

api :host => '0.0.0.0', :port => '8080'

name 'pebble'

def print_data(*data)
  x, y, z = data[1].split(",")

  p "x: #{x}, y: #{y}, z: #{z}"
end

work do
  on pebble, :accel => :print_data
end
