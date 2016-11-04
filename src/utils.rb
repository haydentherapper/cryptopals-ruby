require_relative 'constants'

class Utils
  def self.xor_strings(hex_string1, hex_string2)
    byte_array1 = hex_string1.to_byte_array
    byte_array2 = hex_string2.to_byte_array
    ByteArray.xor_arrays(byte_array1, byte_array2).to_hex_string
  end

  def self.score(hex_string)
    Constants.ENGLISH_LETTER_FREQUENCIES.map do |letter, freq|
      hex_string.count(letter.to_s) * freq
    end.inject(:+)
  end

  def self.decrypt_single_byte_xor(hex_string)
    byte_array = hex_string.to_byte_array
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
      result = decrypt_single_byte_xor(HexString.new(enc_string))
      [result, score(result)]
    end.to_h
    linesToScores.key(linesToScores.values.max)
  end

  def self.repeating_key_xor(input, key)
    slices = input.bytes.each_slice(key.length).map do |slice|
      ByteArray.xor_arrays(slice, key.bytes).to_hex_string
    end
    HexString.new(slices.join)
  end
end
