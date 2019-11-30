require_relative '../../lib/domain_objects/polynomial_part'

RSpec.describe PolynomialPart do
  it 'does not show exponent if 1' do
    expect(described_class.new(coefficient: 4, exponent: 1).to_s).to eq('4x')
    expect(described_class.new(coefficient: 4, exponent: 1).simplify.to_s).to eq('4')
  end

  it 'returns 0 if exponent is 0' do
    expect(described_class.new(coefficient: 4, exponent: 0).to_s).to eq('0')
  end

  it 'if exponent is 1 we can remove it and x' do
    part = described_class.new(coefficient: 2, exponent: 1)
    expect(part.to_s).to eq('2x')
    expect(part.simplify.to_s).to eq('2')
  end

  it 'uses power rule to simplify when appropriate' do
    part = described_class.new(coefficient: 4, exponent: 3)
    expect(part.to_s).to eq('4x^3')
    expect(part.simplify.to_s).to eq('12x^2')
  end

  it 'negative numbers are preserved' do
    part = described_class.new(coefficient: -5, exponent: 2)
    expect(part.to_s).to eq('-5x^2')
    expect(part.simplify.to_s).to eq('-10x')
  end

  it 'a coefficient of 0 returns nil when simplified' do
    part = described_class.new(coefficient: 0, exponent: -1)
    expect(part.to_s).to eq('0')
    expect(part.simplify).to eq(nil)
  end

  it 'a exponent of 0 returns nil when simplified' do
    part = described_class.new(coefficient: 1, exponent: 0)
    expect(part.to_s).to eq('0')
    expect(part.simplify).to eq(nil)
  end
end
