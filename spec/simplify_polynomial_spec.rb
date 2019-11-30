require_relative '../lib/simplify_polynomial'
require_relative '../lib/domain_objects/polynomial_part'
require_relative '../lib/parse_equation'
require_relative '../lib/render_polynomial'
require_relative '../lib/domain_objects/polynomial_constant'

RSpec.describe SimplifyPolynomial do
  let(:parser) { instance_double(ParseEquation) }

  it 'when execute is called parts that return nil when simplified are removed' do
    input = [
      StubPart.new,
      StubPart.new,
      StubNilPart.new
    ]
    expect(described_class.new(polynomial_sections: input).execute.length).to be(2)
  end

  class StubNilPart
    def simplify
      nil
    end
  end

  class StubPart
    def simplify
      self
    end
  end
end
