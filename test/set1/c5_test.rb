require_relative '../test_helper'

class RepeatingKeyXorTest < Minitest::Test
  context 'repeating key xor' do
    setup do
      @input = "Burning 'em, if you ain't quick and nimble\n" +
               "I go crazy when I hear a cymbal"
      @key = "ICE"
      @result = HexString.new("0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f")
    end
    should "output an encrypted string" do
      assert_equal Utils.repeating_key_xor(@input, @key), @result
    end
  end
end
