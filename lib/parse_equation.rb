require_relative 'domain_objects/polynomial_part'
require_relative 'domain_objects/polynomial_constant'

class ParseEquation
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def execute
    equation_sections = []
    sections = separate_input
    sections.each_with_index do |number, index|
      equation_sections << if !first_element?(index) && last_element?(index, sections.length)
                             # return constant
                             PolynomialConstant.new(number)
                           else
                             create_equation_section(coefficient: number)
                           end
    end
    equation_sections
  end

  private

  def separate_input
    input.split('/').map { |str| Integer(str).to_i }
  end

  def create_equation_section(coefficient:)
    exponent = coefficient - 1
    PolynomialPart.new(coefficient: coefficient, exponent: exponent)
  end

  def last_element?(index, length)
    index + 1 == length
  end

  def first_element?(index)
    index.zero?
  end
end
