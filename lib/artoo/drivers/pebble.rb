require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # The pebble driver behaviors
    class Pebble < Driver

      COMMANDS = [:message_queue, :last_message]

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
    end
  end
end
