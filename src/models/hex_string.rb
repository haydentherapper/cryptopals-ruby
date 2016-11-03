require_relative 'byte_array'

class HexString
  attr_accessor :hex_string

  def initialize(hex_string)
    @hex_string = hex_string
  end

  def to_byte_array
    ByteArray.new([@hex_string].pack('H*').bytes)
  end

  def to_base64
    [[@hex_string].pack("H*")].pack("m0")
  end

  def ==(other)
    @hex_string == other.hex_string
  end
end
