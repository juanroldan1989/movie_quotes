<div align="left">
  <a href="https://github.com/juanroldan1989/movie_quotes"><img width="136" src="https://github.com/juanroldan1989/movie_quotes/raw/master/icons/icon3.png" alt="movie_quotes ruby logo" /></a>
</div>

# MovieQuotes
[![Gem Version](https://badge.fury.io/rb/movie_quotes.svg)](https://badge.fury.io/rb/movie_quotes)
[![Code Climate](https://codeclimate.com/github/juanroldan1989/movie_quotes/badges/gpa.svg)](https://codeclimate.com/github/juanroldan1989/movie_quotes)
[![Build Status](https://travis-ci.org/juanroldan1989/movie_quotes.svg?branch=master)](https://travis-ci.org/juanroldan1989/movie_quotes)
[![Dependency Status](https://gemnasium.com/badges/github.com/juanroldan1989/movie_quotes.svg)](https://gemnasium.com/github.com/juanroldan1989/movie_quotes)
[![Coverage Status](https://coveralls.io/repos/github/juanroldan1989/movie_quotes/badge.svg?branch=master)](https://coveralls.io/github/juanroldan1989/movie_quotes?branch=master)
[![Downloads](http://ruby-gem-downloads-badge.herokuapp.com/movie_quotes/0.3.3?type=total&color=brightgreen)](https://rubygems.org/gems/movie_quotes)
[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

A Ruby client for the [MovieQuotes API](https://movie-quotes-api.herokuapp.com)

## Features

* Intuitive API interface navigation.
* URL generation process fully tested when applying filters for each request.
* API integration tests recorded and fully tested using [VCR](https://github.com/vcr/vcr) gem: fast tests (first HTTP request is real and it's response is stored for future runs), deterministic (tests will continue to pass, even if you are offline, or API goes down for maintenance) and accurate (responses will contain the same headers and body you get from a real request).

## Installation

Install the gem by running:

```ruby
gem install movie_quotes
```

or put it in your Gemfile and run `bundle install`:

```ruby
gem "movie_quotes", "~> 0.0.1"
```
