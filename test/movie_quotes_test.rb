require "test_helper"

describe MovieQuotes do
  describe ".configure" do
    before do
      MovieQuotes.configure { |config| config.api_key = "abc123" }
    end

    it "should set main class with api_key" do
      MovieQuotes.configuration.api_key.must_equal "abc123"
    end
  end

  before do
    @filter = MovieQuotes.new
  end

  it "should not have any filter applied" do
    @filter.filters.must_equal({})
  end

  it "should allow to see current URL" do
    @filter.url.must_equal "#{MovieQuotes::BASE_URL}?"
  end

  describe "#by_actor" do
    it "should contain 'actor' param inside URL" do
      @filter.by_actor("bruce")
      @filter.url.must_include "actor=bruce"
    end
  end

  describe "#by_category" do
    describe "filtering by a single category" do
      it "should contain 'category' param inside URL" do
        @filter.by_category("action")
        @filter.url.must_include "categories[]=action"
      end
    end

    describe "filtering by multiple categories" do
      it "should contain 'category' param inside URL" do
        @filter.by_category("action,thriller")
        @filter.url.must_include "categories[]=action,thriller"
      end
    end
  end

  describe "#by_character" do
    it "should contain 'character' param inside URL" do
      @filter.by_character("john")
      @filter.url.must_include "character=john"
    end
  end

  describe "#by_content" do
    it "should contain 'content' param inside URL" do
      @filter.by_content("motherfucker")
      @filter.url.must_include "content=motherfucker"
    end
  end

  describe "#by_movie" do
    it "should contain 'movie' param inside URL" do
      @filter.by_movie("die")
      @filter.url.must_include "movie=die"
    end
  end

  describe "#by_page" do
    it "should contain 'page' param inside URL" do
      @filter.by_page(2)
      @filter.url.must_include "page=2"
    end
  end

  describe "#by_year" do
    describe "filtering by a single year" do
      it "should contain 'year' param inside URL" do
        @filter.by_year(1988)
        @filter.url.must_include "years[]=1988"
      end
    end

    describe "filtering by multiple years" do
      it "should contain 'year' param inside URL" do
        @filter.by_year("1988,2005")
        @filter.url.must_include "years[]=1988,2005"
      end
    end
  end

  describe "#results" do

    describe "with valid api_key" do
      before do
        MovieQuotes.configure do |config|
          config.api_key = "valid_api_key"
        end
      end

      it "should return an array of 'Quote' JSON objects" do
        VCR.use_cassette("quotes_valid_api_key") do
          quotes = @filter.results
          quote  = quotes[1]

          quote["id"].must_equal                3
          quote["content"].must_equal           "I'm gonna make him an offer he can't refuse."

          quote["year"].must_equal              1972
          quote["categories"].must_equal        ["Crime", "Drama"]

          quote["movie"]["title"].must_equal    "The Godfather"
          quote["movie"]["slug"].must_equal     "the-godfather"

          quote["character"]["name"].must_equal "Vito Corleone"
          quote["character"]["slug"].must_equal "vito-corleone"

          quote["actor"]["name"].must_equal     "Marlon Brando"
          quote["actor"]["slug"].must_equal     "marlon-brando"
        end
      end
    end

    describe "with invalid api_key" do
      before do
        MovieQuotes.configure do |config|
          config.api_key = "invalid_api_key"
        end
      end

      it "should return error message" do
        VCR.use_cassette("quotes_invalid_api_key") do
          quotes = @filter.results

          quotes["status"].must_equal  "error"
          quotes["message"].must_equal "Bad credentials"
        end
      end
    end
  end
end
