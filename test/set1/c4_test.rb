require_relative '../test_helper'

class DetectSingleCharXorTest < Minitest::Test
  context 'list of encrypted strings' do
    setup do
      @strings = File.read('test/resources/4.txt').split("\n")
      @result = "Now that the party is jumping\n"
    end
    should "detect the string that was encrypted with a single character" do
      assert_equal Utils.detect_xor_string(@strings), @result
    end
  end
end
