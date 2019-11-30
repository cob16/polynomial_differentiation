require 'bundler/setup'

RSpec.configure do |config|
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def json_output
  JSON.parse(last_response.body, symbolize_names: true)
end
