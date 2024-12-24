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

    def test_output_with_proper_input_without_explicit_delimiter_with_numbers_greater_than_1000
        assert_equal 1015, @string_calculator.add("1*2:3;4)5:1000")
        assert_equal 15, @string_calculator.add("1*2:3;4)5:1001")
    end

    def test_with_negative_numbers_with_explicit_delimiter
        error = assert_raises do
            @string_calculator.add("//[@@@][;]\n10@@@-2@@@-4;-98;48")
        end
        assert_equal("Negative numbers (-2, -4, -98) are provided", error.message)
    end

    def test_output_with_proper_input_with_explicit_delimiter
        assert_equal 6, @string_calculator.add("//[***]\n1***2***3")
        assert_equal 11, @string_calculator.add("//[*][%]\n1*4%6")
    end

    def test_output_with_proper_input_with_explicit_delimiter_with_numbers_greater_than_1000
        assert_equal 1011, @string_calculator.add("//[*][%]\n1*4%6%1000")
        assert_equal 15, @string_calculator.add("//[*][:][;][)]\n1*2:3;4)5:1001")
    end
end