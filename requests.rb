require 'sinatra'
require 'json'

require_relative 'lib/polynomial'

get '/differentiate/*' do
  content_type :json

  begin
    input = parse_input params['splat']
  rescue ArgumentError
    return client_error
  end

  polynomial = Polynomial.new(input)
  generate_response(rendered_input: polynomial.render_input)
end

def parse_input(args)
    args.first.split('/').map { |str| Integer(str).to_i }
end

def client_error
  [400, {}.to_json]
end

def generate_response(rendered_input:)
  [200, {rendered_input: rendered_input, answer: 'Mock answer' }.to_json]
end
