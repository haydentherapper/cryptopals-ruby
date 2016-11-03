require_relative '../test_helper'

class BreakRepeatingKeyXorTest < Minitest::Test
  context "repeating-key xor encrypted string" do
    setup do
      @input = File.read('test/resources/6.txt').split("\n").join
      @result = "Now that the party is jumping\n"
    end
    should "be decrypted" do
      assert_equal Utils.detect_xor_string(@strings), @result
    end
  end
end
