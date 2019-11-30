require_relative '../lib/polynomial'

RSpec.describe Polynomial do
  it 'input of 2 represents the following polynomial' do
    # differs from example of retuning '2x^1' and instead returns a simplified '2x'
    expect(described_class.new([2]).render_input).to eq("f(x) = 2x")
  end

  it 'input of 3 2 1 represents the following polynomial' do
    expect(described_class.new([3,2,1]).render_input).to eq("f(x) = 3x^2+2x+1")
  end

  it 'input of 4 3 2 1 represents the following polynomial' do
    expect(described_class.new([4, 3, 2, 1]).render_input).to eq("f(x) = 4x^3+3x^2+2x+1")
  end

  it 'input of 4 3 0 1 represents the following polynomial' do
    expect(described_class.new([4, 3, 0, 1]).render_input).to eq("f(x) = 4x^3+3x^2+0+1")
  end

end