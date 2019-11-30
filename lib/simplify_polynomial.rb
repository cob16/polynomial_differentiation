class SimplifyPolynomial
  attr_reader :polynomial_sections

  def initialize(polynomial_sections:)
    @polynomial_sections = polynomial_sections
  end

  def execute
    polynomial_sections.map(&:simplify).compact
  end
end
