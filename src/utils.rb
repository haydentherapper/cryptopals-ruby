class Utils
  def self.hex_to_base64(hex_string)
    [[hex_string].pack("H*")].pack("m0")
  end

  def self.to_byte_array(hex_string)
    [hex_string].pack('H*').bytes
  end

  def self.to_hex_string(byte_array)
    byte_array.pack('C*').unpack('H*').first
  end

  def self.xor_strings(hex_string1, hex_string2)
    bytes_list = to_byte_array(hex_string1).zip(to_byte_array(hex_string2))
    to_hex_string(bytes_list.map { |byte1, byte2| byte1 ^ byte2 })
  end
end
