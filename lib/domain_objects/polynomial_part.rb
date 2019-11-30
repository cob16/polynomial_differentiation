class PolynomialPart
  attr_reader :coefficient, :exponent, :showx

  def initialize(coefficient: 2, exponent: 3, showx: true)
    @coefficient = coefficient
    @exponent = exponent
    @showx = showx
  end

  def to_s
    if coefficient.zero? || exponent.zero?
      '0'
    elsif exponent == 1 && !showx
      coefficient.to_s
    elsif exponent == 1
      "#{@coefficient}x".to_s
    else
      "#{@coefficient}x^#{@exponent}"
    end
  end

  def simplify
    return nil if coefficient.zero? || exponent.zero?

    if exponent == 1
      # special case for power_rule
      self.class.new(coefficient: coefficient, exponent: exponent, showx: false)
    else
      apply_power_rule
    end
  end

  private

  def apply_power_rule
    new_coefficient = @coefficient * @exponent
    new_exponent = @exponent - 1
    self.class.new(coefficient: new_coefficient, exponent: new_exponent)
  end
end
