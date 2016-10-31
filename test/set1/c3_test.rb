require_relative '../test_helper'

class SingleByteXORCipherTest < Minitest::Test
  context 'single_byte_xor_cipher' do
    setup do
      @hex_string = '1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736'
      @result = "Cooking MC's like a pound of bacon"
    end
    should 'should be decrypted' do
      assert_equal Utils.decrypt_single_byte_xor(@hex_string), @result
    end
  end
end
