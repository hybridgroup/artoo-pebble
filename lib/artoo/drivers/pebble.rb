require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # The pebble driver behaviors
    class Pebble < Driver

      COMMANDS = [:message_queue, :last_message, :publish_event]

      # Start driver and any required connections
      # Public: Starts the driver.
      #
      # Returns null.
      def start_driver
        @messages = []
      end

      def message_queue
        @messages
      end

      def last_message
        @messages.last
      end

      def publish_event(name, data)
        publish(event_topic_name(name), data)
      end

    end
  end
end
