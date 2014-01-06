require File.expand_path(File.dirname(__FILE__) + "/../test_helper")
require 'artoo/adaptors/pebble'

describe Artoo::Adaptors::Pebble do
  before do
    @connection = mock('connect')
    @adaptor = Artoo::Adaptors::Pebble.new(:parent => @connection)
  end

  it 'Artoo::Adaptors::Pebble#connect' do
    @adaptor.connect
    @adaptor.connected?.must_equal true
  end

  it 'Artoo::Adaptors::Pebble#disconnect' do
    @adaptor.connect
    @adaptor.disconnect
    @adaptor.connected?.must_equal false
  end
end
