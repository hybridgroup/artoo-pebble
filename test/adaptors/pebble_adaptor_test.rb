require File.expand_path(File.dirname(__FILE__) + "/../test_helper")
require 'artoo/adaptors/pebble'

describe Artoo::Adaptors::Pebble do
  before do
    @connection = mock('connect')
    @connection.stubs(:connection_id).returns("F123")
    @port = Artoo::Port.new('/dev/awesome')
    @adaptor = Artoo::Adaptors::Pebble.new(:port => @port, :parent => @connection)
    @pebble = mock('pebble')
    Pebble::Watch.stubs(:new).returns(@pebble)
  end

  it 'Artoo::Adaptors::Pebble#connect' do
    @pebble.expects(:connect)
    @adaptor.connect
    @adaptor.connected?.must_equal true
  end

  it 'Artoo::Adaptors::Pebble#disconnect' do
    @pebble.stubs(:connect)
    @adaptor.connect

    @pebble.expects(:disconnect)
    @adaptor.disconnect
    @adaptor.connected?.must_equal false
  end
end
