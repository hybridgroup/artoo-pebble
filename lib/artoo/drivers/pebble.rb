require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # The pebble driver behaviors
    class Pebble < Driver

      COMMANDS = [:ping, :notification_sms, :notification_email, :set_nowplaying_metadata,
                  :get_versions, :get_installed_apps, :remove_app, :get_time, :set_time,
                  :system_message, :reset]

      # Start driver and any required connections
      # Public: Starts the driver.
      #
      # Returns null.
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

      # Public: Handles different message events.
      #
      # Returns sphero_event.
      def handle_message_events
        while not connection.protocol.messages.empty? do 
          e = connection.protocol.messages.pop
          publish(event_topic_name(e[0].to_s), e[1])
        end          
      end
    end
  end
end
