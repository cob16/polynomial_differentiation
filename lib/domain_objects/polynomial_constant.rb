class PolynomialConstant
  attr_reader :constant

  def initialize(constant)
    @constant = constant
  end

  def simplify
    nil
  end

  def to_s
    constant.to_s
  end
end
