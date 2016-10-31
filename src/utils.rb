require_relative 'constants'

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

  def self.decrypt_single_byte_xor(hex_string)
    byte_array = to_byte_array(hex_string)
    # For each possible byte...
    guesses = (1..255).map do |char|
      # ...decrypt the string with that byte...
      decrypt_attempt = byte_array.map { |byte| (byte ^ char).chr }.join
      # ...and score the attempt, building a map of decrypted string to score
      score = Constants.ENGLISH_LETTER_FREQUENCIES.map do |letter, freq|
        decrypt_attempt.count(letter.to_s) * freq
      end.inject(:+)
      [decrypt_attempt, score]
    end.to_h
    # Return the decrypted string with the highest score
    guesses.key(guesses.values.max)
  end
end
