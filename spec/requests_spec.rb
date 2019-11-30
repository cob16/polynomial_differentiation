require_relative '../requests'

ENV['APP_ENV'] = 'test'
require 'rack/test'



RSpec.describe 'differentiate route' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'returns 200 when given args' do
    get '/differentiate/1/2/3'
    expect(last_response.status).to eq 200

  end

  it 'bad input returns a 400 error' do
    get '/differentiate/1/words/3'
    expect(last_response.status).to eq 400
    expect(json_output).to eq({})
  end

  it 'returns rendered equation' do
    get '/differentiate/2/3/4'
    expect(json_output.fetch(:rendered_input)).to eq('f(x) = 2x+3x^2+4')
  end

  it 'returns equation answer' do
    get '/differentiate/1/2/3'
    expect(json_output.fetch(:answer)).to eq("Mock answer")
  end

  def json_output
    JSON.parse(last_response.body, symbolize_names: true)
  end
end
