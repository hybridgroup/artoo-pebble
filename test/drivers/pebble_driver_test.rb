require File.expand_path(File.dirname(__FILE__) + "/../test_helper")
require 'artoo/drivers/pebble'

describe Artoo::Drivers::Pebble do

  before do
    @driver = Artoo::Drivers::Pebble.new(:parent => @connection)
    @driver.start_driver
  end

  it 'creates message queue' do
    @driver.message_queue.must_equal []
  end

  it 'adds message to queue when sending notification' do
    @driver.send_notification("hello")

    @driver.message_queue.must_equal ["hello"]
  end

  it 'retrieves pending messages' do
    @driver.send_notification("hello")
    @driver.send_notification("world")

    @driver.pending_message.must_equal "hello"
    @driver.pending_message.must_equal "world"
    @driver.pending_message.must_equal nil
  end

end
