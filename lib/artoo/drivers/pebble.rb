require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # The pebble driver behaviors
    class Pebble < Driver

      COMMANDS = [:set_nowplaying_metadata]

      # Start driver and any required connections
      def start_driver
        begin
          every(interval) do
            handle_message_events
          end

          connection.listen_for_events(false)

          super
        rescue Exception => e
          Logger.error "Error starting Pebble driver!"
          Logger.error e.message
          Logger.error e.backtrace.inspect
        end
      end

      def handle_message_events
        while not connection.protocol.messages.empty? do 
          e = connection.protocol.messages.pop
          publish(event_topic_name(e[0].to_s), e[1])
        end          
      end
    end
  end
end
