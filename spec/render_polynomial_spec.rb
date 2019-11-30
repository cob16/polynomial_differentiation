require_relative '../lib/render_polynomial'

RSpec.describe RenderPolynomial do
  it 'calls to_s on sections' do
    fake_section = FakeSection.new
    expect(described_class.new(polynomial_sections: [fake_section]).execute).to eq('f(x) = string_version')
  end

  it 'adds a plus between sections' do
    expect(described_class.new(polynomial_sections: %w[2x 3x]).execute).to eq('f(x) = 2x+3x')
  end

  it 'makes the left hand prime if requested' do
    expect(described_class.new(polynomial_sections: %w[2x 3x], prime: true).execute).to eq("f'(x) = 2x+3x")
  end

  it 'can render a complex polynomial' do
    expect(
      described_class.new(polynomial_sections: ['4x^3', '3x^2', 0, 1]).execute
    ).to eq('f(x) = 4x^3+3x^2+0+1')
  end

  class FakeSection
    def to_s
      'string_version'
    end
  end
end
