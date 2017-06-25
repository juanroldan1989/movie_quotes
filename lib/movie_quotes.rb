require "configuration"
require "httparty"

class MovieQuotes
  include HTTParty

  # testing purposes
  # BASE_URL = "http://dev.movie-quotes.com:3000/v1/quotes".freeze

  BASE_URL = "https://movie-quotes-app.herokuapp.com/api/v1/quotes".freeze

  attr_reader :filters

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new

    yield(configuration)
  end

  def initialize
    @filters = {}
  end

  def by_actor(query)
    apply_filter "actor", query

    self
  end

  # "sci-fi" | ["sci-fi", "action", "drama"]
  def by_category(query)
    # "OR" behavior by default
    apply_filter_list "categories", query

    self
  end

  def by_character(query)
    apply_filter "character", query

    self
  end

  def by_content(query)
    apply_filter "content", query

    self
  end

  def by_movie(query)
    apply_filter "movie", query

    self
  end

  def by_page(page)
    apply_filter "page", page

    self
  end

  def by_rating(rating)
    apply_filter "rating", rating

    self
  end

  # 1999 | [1999, 2005] | ["1999", "2005"]
  def by_year(query)
    apply_filter_list "years", query

    self
  end

  def results
    @results = HTTParty.get(url, headers: headers)
  end

  def url
    "#{BASE_URL}?#{get_filters}"
  end

  private

  def api_key
    @api_key ||= MovieQuotes.configuration.api_key
  end

  def apply_filter(filter_name, value)
    filters[filter_name] = value
  end

  def apply_filter_list(filter_name, value)
    # categories[]=crime,sci-fi
    filters["#{filter_name}[]"] = [value].flatten.join(",")
  end

  def get_filters
    filters.map { |k,v| "#{k}=#{v}" }.join("&")
  end

  def headers
    { "Authorization"=>"Token token=\"#{api_key}\"" }
  end
end
