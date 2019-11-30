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

  it 'returns rendered equations' do
    get '/differentiate/4/3/2/1'
    expect(json_output.fetch(:rendered_input)).to eq('f(x) = 4x^3+3x^2+2x+1')
    expect(json_output.fetch(:answer)).to be_truthy
  end
end
