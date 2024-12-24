require "minitest/autorun"
require_relative "../lib/string_calculator"

class TestStringCalculator < Minitest::Test
    def setup
        @string_calculator = StringCalculator.new
    end

    def test_empty_string_input
        assert_equal 0, @string_calculator.add("")
    end
end