$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "movie_quotes"
  s.version     = "0.1.3"
  s.date        = "2018-05-31"
  s.summary     = "Movie Quotes"
  s.description = "Ruby client to interact with MovieQuotes API - http://movie-quotes-app.herokuapp.com/"
  s.authors     = ["Juan Roldan"]
  s.email       = "juanroldan1989@gmail.com"
  s.files       = Dir["{lib}/**/*"]
  s.homepage    = "http://rubygems.org/gems/movie_quotes"
  s.license     = "MIT"

  s.required_ruby_version = ">= 2.1.2"

  s.add_dependency "httparty", "~> 0.15.5"

  s.add_development_dependency "vcr",     "~> 3.0.3"
  s.add_development_dependency "webmock", "~> 2.3.2"
end
