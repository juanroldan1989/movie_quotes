require "httparty"
require "version"

class MovieQuotes
  include HTTParty

  BASE_URL = "http://dev.movie-quotes.com:3000/v1/quotes".freeze

  def results
    @results = HTTParty.get(BASE_URL)
  end
end
