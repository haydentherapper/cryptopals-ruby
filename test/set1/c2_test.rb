require_relative '../test_helper'

class FixedXORTest < Minitest::Test
  context 'fixed_xor' do
    setup do
      @hex_string1 = '1c0111001f010100061a024b53535009181c'
      @hex_string2 = '686974207468652062756c6c277320657965'
      @result = '746865206b696420646f6e277420706c6179'
    end
    should 'xor two strings and produce one string' do
      assert_equal Utils.xor_strings(@hex_string1, @hex_string2), @result
    end
  end
end
