require_relative '../test_helper'

class HexToBase64Test < Minitest::Test
  context 'converter' do
    setup do
      @hex_string = HexString.new('49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d')
      @base64_string = 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'
    end
    should 'convert hex to base64' do
      assert_equal @hex_string.to_base64, @base64_string
    end
  end

end
