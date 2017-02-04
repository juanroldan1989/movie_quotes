require "test_helper"

describe Configuration do
  describe "#api_key" do

    before do
      @configuration = Configuration.new
    end

    describe "when api_key is not set" do
      it "should return default api_key" do
        @configuration.api_key.must_equal "default_api_key"
      end
    end

    describe "when api_key is set" do
      it "should return custom api_key" do
        @configuration.api_key = "abc123"
        @configuration.api_key.must_equal "abc123"
      end
    end

  end
end
