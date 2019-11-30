ENV['APP_ENV'] = 'test'
require 'rack/test'

require_relative '../../requests'

RSpec.describe 'differentiate route' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'can differentiate' do
    get '/differentiate/3/2/1'
    expect(json_output.fetch(:rendered_input)).to eq('f(x) = 3x^2+2x+1')
    expect(json_output.fetch(:answer)).to eq("f'(x) = 6x+2")
  end

  it 'deals with more than 3 inputs' do
    get '/differentiate/4/3/2/1'
    expect(json_output.fetch(:rendered_input)).to eq('f(x) = 4x^3+3x^2+2x+1')
    expect(json_output.fetch(:answer)).to eq("f'(x) = 12x^2+6x+2")
  end

  it 'deals with 0' do
    get '/differentiate/4/3/0/1'
    expect(json_output.fetch(:rendered_input)).to eq('f(x) = 4x^3+3x^2+0+1')
    expect(json_output.fetch(:answer)).to eq("f'(x) = 12x^2+6x")
  end

  xit 'deal with negative numbers' do
    get '/differentiate/4/-5/0/1'
    expect(json_output.fetch(:rendered_input)).to eq('f(x) = 4x^3+-5x^-6+0+1')
    expect(json_output.fetch(:answer)).to eq("f'(x) = 12x^2-10x")
  end
end
