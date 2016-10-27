class Utils
  def self.hex_to_base64(hex_string)
    [[hex_string].pack("H*")].pack("m0")
  end
end
