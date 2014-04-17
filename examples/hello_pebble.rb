require 'artoo'

connection :pebble, :adaptor => :pebble
device     :watch,  :driver  => :pebble, :name => 'pebble'

api :host => '0.0.0.0', :port => '8080'

name 'pebble'

def button_push(*data)
  unless data[1].nil?
    case data[1]
    when '1' then p "up button pushed"
    when '0' then p "select button pushed"
    when '2' then p "down button pushed"
    else p "Unknown button event"
    end
  end
end

work do
  on pebble, :button => :button_push
end
