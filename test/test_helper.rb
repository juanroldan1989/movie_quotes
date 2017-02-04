require "coveralls"
Coveralls.wear!

require "minitest/spec"
require "minitest/autorun"
require "movie_quotes"

require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "test/fixtures"
  config.hook_into :webmock
end
