require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # The pebble driver behaviors
    class Pebble < Driver

      COMMANDS = [:messages, :last_message]

      # Start driver and any required connections
      def start_driver
        @messages = []
      end

      def messages
        @messages
      end

      def last_message
        @messages.last
      end
    end
  end
end
