require 'artoo/adaptors/adaptor'

module Artoo
  module Adaptors
    # Connect to a pebble device
    # @see device documentation for more information
    class Pebble < Adaptor
      finalizer :finalize
      attr_reader :pebble

      # Number of retries when connecting
      RETRY_COUNT = 5

      # Closes connection with device if connected
      # @return [Boolean]
      def finalize
        pebble.disconnect if connected?
      end

      # Creates a connection with device
      # @return [Boolean]
      def connect
        @retries_left = RETRY_COUNT
        require 'pebble' unless defined?(::Pebble)
        begin
          #::Pebble.logger.level = ::Logger::DEBUG
          @pebble = ::Pebble::Watch.new(parent.connection_id, connect_to)
          @pebble.connect
          super
          return true
        rescue Errno::EBUSY => e
          @retries_left -= 1
          if @retries_left > 0
            retry
          else
            Logger.error e.message
            Logger.error e.backtrace.inspect
            return false
          end
        end
      end

      # Closes connection with device
      # @return [Boolean]
      def disconnect
        pebble.disconnect if connected?
        super
      end

      # Uses method missing to call device actions
      # @see Pebble documentation
      def method_missing(method_name, *arguments, &block)
        pebble.send(method_name, *arguments, &block)
      end
    end
  end
end
