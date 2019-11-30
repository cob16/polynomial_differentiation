require 'sinatra'
require 'json'

require_relative 'lib/parse_equation'
require_relative 'lib/render_polynomial'
require_relative 'lib/simplify_polynomial'

get '/differentiate/*' do
  content_type :json

  begin
    input = ParseEquation.new(input_args).execute
  rescue StandardError => e
    pp e
    return client_error
  end

  answer = SimplifyPolynomial.new(polynomial_sections: input).execute
  generate_response(
    input: RenderPolynomial.new(polynomial_sections: input).execute,
    output: RenderPolynomial.new(polynomial_sections: answer, prime: true).execute
  )
end

def input_args
  params['splat'].first
end

def client_error
  [400, {}.to_json]
end

def generate_response(input:, output:)
  [200, { rendered_input: input, answer: output }.to_json]
end
