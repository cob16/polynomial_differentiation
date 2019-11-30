class Polynomial
  attr_reader :numbers

  def initialize(numbers)
    @numbers = numbers
  end

    def render_input
      output = 'f(x) = '
      numbers.each_with_index do |number, index|
        output << '+' unless index == 0
        if index != 0 && last_input?(index)
          output << number.to_s
        else
            output << render_equation_section(number)
        end
      end
      output
    end

  private

  def render_equation_section(number)
    exponent = number - 1
     if exponent < 1
       '0'
     elsif exponent == 1
       "#{number}x".to_s
     else
       "#{number}x^#{exponent}".to_s
     end
  end

  def last_input?(index)
    index + 1 == numbers.length
  end
end