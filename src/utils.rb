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

  def self.score(hex_string)
    Constants.ENGLISH_LETTER_FREQUENCIES.map do |letter, freq|
      hex_string.count(letter.to_s) * freq
    end.inject(:+)
  end

  def self.decrypt_single_byte_xor(hex_string)
    byte_array = to_byte_array(hex_string)
    # For each possible byte...
    guesses = (1..255).map do |char|
      # ...decrypt the string with that byte...
      decrypt_attempt = byte_array.map { |byte| (byte ^ char).chr }.join
      # ...and score the attempt, building a map of decrypted string to score
      [decrypt_attempt, score(decrypt_attempt)]
    end.to_h
    # Return the decrypted string with the highest score
    guesses.key(guesses.values.max)
  end

  def self.detect_xor_string(strings)
    linesToScores = strings.map do |enc_string|
      result = decrypt_single_byte_xor(enc_string)
      [result, score(result)]
    end.to_h
    linesToScores.key(linesToScores.values.max)
  end
end
