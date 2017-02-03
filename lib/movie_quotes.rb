require "httparty"
require "version"

class MovieQuotes
  include HTTParty

  BASE_URL = "http://dev.movie-quotes.com:3000/v1/quotes".freeze

  attr_reader :filters

  def initialize
    @filters = { "rows" => "20" }
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

  # 1999 | [1999, 2005] | ["1999", "2005"]
  def by_year(query)
    apply_filter_list "years", query

    self
  end

  def results
    @results = HTTParty.get(url)
  end

  def url
    "#{BASE_URL}?#{get_filters}"
  end

  private

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
end
