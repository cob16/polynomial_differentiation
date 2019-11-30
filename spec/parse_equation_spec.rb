require_relative '../lib/parse_equation'

RSpec.describe ParseEquation do
  it 'empty input returns nothing' do
    expect(described_class.new('').execute).to eq([])
  end

  it 'input of 2 represents the following polynomial' do
    expect(described_class.new('2').execute).to match_array(
      [have_attributes(class: PolynomialPart, coefficient: 2, exponent: 1)]
    )
  end

  it 'input of 3 2 1 represents the following polynomial' do
    expect(described_class.new('3/2/1').execute).to match_array(
      [
        have_attributes(class: PolynomialPart, coefficient: 3, exponent: 2),
        have_attributes(class: PolynomialPart, coefficient: 2, exponent: 1),
        have_attributes(class: PolynomialConstant, constant: 1)
      ]
    )
  end

  it 'input of 4 3 2 1 represents the following polynomial' do
    expect(described_class.new('4/3/2/1').execute).to match_array(
      [
        have_attributes(class: PolynomialPart, coefficient: 4, exponent: 3),
        have_attributes(class: PolynomialPart, coefficient: 3, exponent: 2),
        have_attributes(class: PolynomialPart, coefficient: 2, exponent: 1),
        have_attributes(class: PolynomialConstant, constant: 1)
      ]
    )
  end
end
