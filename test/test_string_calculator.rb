require "minitest/autorun"
require_relative "../lib/string_calculator"

class TestStringCalculator < Minitest::Test
    def setup
        @string_calculator = StringCalculator.new
    end

    def test_empty_string_input
        assert_equal 0, @string_calculator.add("")
    end

    def test_invalid_input
        assert_equal "Invalid Input given: 1*2*", @string_calculator.add("1*2*")
        assert_equal "Invalid Input given: *", @string_calculator.add("*")
    end

    def test_with_negative_numbers_without_explicit_delimiter
        error = assert_raises do
            @string_calculator.add("-112")
        end
        assert_equal("Negative numbers (-112) are provided", error.message)
        error = assert_raises do
            @string_calculator.add("1*-2&9%4*-10&-90")
        end
        assert_equal("Negative numbers (-2, -10, -90) are provided", error.message)
    end

    def test_output_with_proper_input_without_explicit_delimiter
        assert_equal 1, @string_calculator.add("1")
        assert_equal 15, @string_calculator.add("1*2:3;4)5")
        assert_equal 90, @string_calculator.add("//[20.20.50")
    end
end