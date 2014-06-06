require 'bundler/setup'
Bundler.setup
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start if ENV['CODECLIMATE_REPO_TOKEN']

require 'expose_query' # and any other gems you need

RSpec.configure do |config|
  # some (optional) config here
end
