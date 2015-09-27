require 'bundler/setup'
require 'active_record'
require 'active_record/fixtures'
require 'pry'
Bundler.setup

if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

require 'expose_query' # and any other gems you need

FIXTURES_PATH = File.join(File.dirname(__FILE__), 'fixtures')

ActiveRecord::Base.establish_connection(
    :adapter => defined?(JRUBY_VERSION) ? 'jdbcsqlite3' : 'sqlite3',
    :database => ':memory:'
)

dep = defined?(ActiveSupport::Dependencies) ? ActiveSupport::Dependencies : ::Dependencies
dep.autoload_paths.unshift FIXTURES_PATH

ActiveRecord::Migration.verbose = false
load File.join(FIXTURES_PATH, 'schema.rb')

RSpec.configure do |config|
  # some (optional) config here
end
