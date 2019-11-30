require_relative './domain_objects/polynomial_part'
class RenderPolynomial
  attr_reader :polynomial_sections, :prime

  def initialize(polynomial_sections:, prime: false)
    @polynomial_sections = polynomial_sections
    @prime = prime
  end

  def execute
    output = prime ? "f'(x) = " : 'f(x) = '
    output << polynomial_sections.map(&:to_s).join('+')
    output
  end
end
