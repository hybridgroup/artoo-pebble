require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # The pebble driver behaviors
    class Pebble < Driver

      COMMANDS = [:send_notification, :pending_message, :publish_event]

      # Start driver and any required connections
      # Public: Starts the driver.
      #
      # Returns null.
      def start_driver
        @messages = []
      end

      def send_notification(message)
        @messages << message

        message
      end

      def message_queue
        @messages
      end

      def pending_message
        @messages.shift
      end

      def publish_event(name, data)
        publish(event_topic_name(name), data)
        nil
      end

    end
  end
end
