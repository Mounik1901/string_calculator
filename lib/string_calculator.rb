class StringCalculator
    def add(number_str)
        if(number_str == "")
            return 0
        elsif(number_str.scan(/\d+\z/).length == 0)
            return "Invalid Input given: #{number_str}"
        else
            if(number_str.start_with?("//[")) && number_str.include?("]\n")
                ds = number_str.scan(/\[(.*?)\]/).flatten.join()
                numbers = number_str.split("\n")[1].split(/[#{ds}]/)
            else
                numbers = number_str.scan(/-?\d+/)
            end
            numbers = numbers.map(&:to_i)
            negative_numbers = numbers.select{|ele| ele < 0}
            if(negative_numbers.length > 0)
              raise "Negative numbers (#{negative_numbers.join(", ")}) are provided"
            else
              numbers_sum = numbers.select{|ele| ele <= 1000}.sum
              return numbers_sum
            end
        end
    end
end