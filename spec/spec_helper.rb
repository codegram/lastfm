require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'lastfm'
require 'rspec'
require 'vcr'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

require 'yaml'

API_KEY = YAML.load( File.open('spec/support/api_key.yml') )["api_key"]

VCR.config do |c|
  c.cassette_library_dir = 'spec/support/vcr_fixtures'
  c.http_stubbing_library = :fakeweb
end
