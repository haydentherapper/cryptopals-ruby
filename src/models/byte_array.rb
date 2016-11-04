require_relative 'hex_string'

class ByteArray < Array
  attr_accessor :array

  def initialize(array)
    super(array)
    @array = array
  end

  def to_hex_string
    HexString.new(@array.pack('C*').unpack('H*').first)
  end

  def self.xor_arrays(byte_array1, byte_array2)
    min_size = [byte_array1.size, byte_array2.size].min
    trunc_arr1 = byte_array1.take(min_size)
    trunc_arr2 = byte_array2.take(min_size)
    result = trunc_arr1.zip(trunc_arr2).map { |byte1, byte2| byte1 ^ byte2 }
    ByteArray.new(result)
  end
end
