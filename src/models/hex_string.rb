require_relative 'byte_array'

class HexString < String
  attr_accessor :string

  def initialize(string)
    super(string)
    @string = string
  end

  def to_byte_array
    ByteArray.new([@string].pack('H*').bytes)
  end

  def to_base64
    [[@string].pack("H*")].pack("m0")
  end
end
