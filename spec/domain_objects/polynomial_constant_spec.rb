require_relative '../../lib/domain_objects/polynomial_constant'

RSpec.describe PolynomialConstant do
  it 'to_s returns correct string' do
    expect(described_class.new(1).to_s).to eq('1')
  end

  it 'simplified constants can be eliminated' do
    expect(described_class.new(1).simplify).to be_nil
  end
end
