<div align="left">
  <a href="https://github.com/juanroldan1989/movie_quotes"><img width="136" src="https://github.com/juanroldan1989/movie_quotes/raw/master/icons/icon3.png" alt="movie_quotes ruby logo" /></a>
</div>

# MovieQuotes
[![Gem Version](https://badge.fury.io/rb/movie_quotes.svg)](https://badge.fury.io/rb/movie_quotes)
[![Code Climate](https://codeclimate.com/github/juanroldan1989/movie_quotes/badges/gpa.svg)](https://codeclimate.com/github/juanroldan1989/movie_quotes)
[![Build Status](https://travis-ci.org/juanroldan1989/movie_quotes.svg?branch=master)](https://travis-ci.org/juanroldan1989/movie_quotes)
[![Coverage Status](https://coveralls.io/repos/github/juanroldan1989/movie_quotes/badge.svg?branch=master)](https://coveralls.io/github/juanroldan1989/movie_quotes?branch=master)
[![Downloads](http://ruby-gem-downloads-badge.herokuapp.com/movie_quotes/0.1.3?type=total&color=brightgreen)](https://rubygems.org/gems/movie_quotes)
[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)
<!-- [![Dependency Status](https://gemnasium.com/badges/github.com/juanroldan1989/movie_quotes.svg)](https://gemnasium.com/github.com/juanroldan1989/movie_quotes) -->

Ruby client for [MovieQuotes](https://movie-quotes-app.herokuapp.com) API

## Features

* Fetch well known quotes from more than 500 movies.
* Search through movie quotes by `actors`, `characters`, `movies`, `genres`, `years` and even pieces of quotes. 
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
gem "movie_quotes", "~> 0.1.3"
```

## 1. Usage

To start using the gem, you should get an API Key (free).

Once completed this quick [form](https://docs.google.com/forms/d/e/1FAIpQLSeavfLgmnF2haKsaNlp8hYA4DSqdwb1ZMg5Xse7a-mFW4bZIg/viewform) the API Key will be sent to you by Juan Roldan (`juanroldan1989@gmail.com`)

Setup the API Key within an initializer:

```ruby
# movie_quotes_initializer.rb

MovieQuotes.configure do |config|
  config.api_key = "abcd1234"
end
```

Then create a new filter instance like so:

```ruby
filter = MovieQuotes.new
```

and then call api methods, for instance, to fetch well known movie quotes from `actors` like `Al Pacino`:

```ruby
filter.by_actor("al pacino")
```

or `charachters` like `morpheus`:

```ruby
filter.by_character("morpheus")
```

or `movies` like `Die Hard` and `actors` like `Bruce Willis`:

```ruby
filter.by_movie("die hard").by_actor("bruce willis")
```

Once applied all the filters you need, make the API call to get the quotes:

```ruby
filter.results
```

To see a full list of examples please check the <a href="https://github.com/juanroldan1989/movie_quotes/wiki">wiki</a> page.

## 2. Response
The response format is JSON by default. Results are provided as an array of objects with the following structure:

<div align="left">
  <img src="https://i.ytimg.com/vi/YfpDSNNgYhI/hqdefault.jpg" alt="movie_quotes die hard" />
</div>

```ruby
filter = MovieQuotes.new
filter.by_movie("die hard").by_actor("bruce willis")
filter.results
=> [
  {
    "content": "Yippie-ki-yay, motherfucker!",
    "rating": 5,
    "year": 1988,
    "categories": [
      "Thriller",
      "Crime",
      "Action"
    ],
    "image_large_url": "https://i.ytimg.com/vi/YfpDSNNgYhI/hqdefault.jpg",
    "image_thumb_url": "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRlniyMNhCV4h8UF9zn6Lka4s-OTU_j7Br43Kp5OR7eGljOAIpDXKystfQ",
    "movie": {
      "title": "Die Hard",
      "slug": "die-hard"
    },
    "character": {
      "name": "John Mc Clane",
      "slug": "john-mc-clane"
    },
    "actor": {
      "name": "Bruce Willis",
      "slug": "bruce-willis"
    }
  }
]
```

## 3. Development

Questions or problems? Please post them on the [issue tracker](https://github.com/juanroldan1989/movie_quotes/issues). You can contribute changes by forking the project and submitting a pull request. You can ensure the tests are passing by running `bundle` and `rake`.

## 4. Projects

Developers around the world using **MovieQuotes** API with their projects:

| pic | @mention | area |
|---|---|---|
| ![@djibba22](https://avatars0.githubusercontent.com/u/7789098?s=64) | [@djibba22](https://github.com/djibba22) | building some workflows for personal use with the Workflow app on iOS |
| ![@snowfrogdev](https://avatars2.githubusercontent.com/u/22530235?s=64) | [@snowfrogdev](https://github.com/snowfrogdev) | developing a non-commercial app about movies |
| ![@jargoglesara](https://avatars2.githubusercontent.com/u/54005403?s=64) | [@jargoglesara](https://github.com/jargoglesara) | developing a Google Assistant action to interact with the API |
| ![@GregJacobs82](https://avatars1.githubusercontent.com/u/10404159?s=64) | [@GregJacobs82](https://github.com/GregJacobs82) | developing a sort of "quiz" where a player is supposed to guess who said something and I tought that quotes from movies would be much easier for everyone than other random quotes |
| ![@eDubrovsky](https://avatars0.githubusercontent.com/u/46897754?s=64) | [@eDubrovsky](https://github.com/eDubrovsky) | practicing API's and gem documentation's in Rails (newbie lvl), and I was searching on rubygems.org when I found yours. Looks straight forward to use :) |
| ![@pyremell](https://avatars2.githubusercontent.com/u/8838921?s=64) | [@pyremell](https://github.com/pyremell) | I am IT student and I developing a project for a course. I would love to have an API key for your Movie Quotes app, so I could make small searches, based in the movie name, to retrieve some famous quotes from that movie. |
| ![@shmlkv](https://avatars0.githubusercontent.com/u/9050229?s=64) | [@shmlkv](https://github.com/shmlkv) | School project, it will display movie info and showtimes in cinemas asweel as quotes from actors |
| ![@KaiRichardson](https://avatars0.githubusercontent.com/u/11099512?s=64) | [@KaiRichardson](https://github.com/KaiRichardson) | A JavaScript/React project built as part of the requirements for completion of the Javascript/React course at Code Louisville: https://github.com/brevans25/Vide-Video |
| ![@alexandershin](https://avatars0.githubusercontent.com/u/39719194?s=64) | [@alexandershin](https://github.com/alexandershin) | Random Quote machine (FreeCodeCamp course project) |
| ![@alex-perez](https://avatars0.githubusercontent.com/u/4401902?s=64) | [@alex-perez](https://github.com/alex-perez) | The API will be use for a practicing application. An intern will come in my compagny in next week. He will build a simple app using this api |
| ![@shadowM8](https://avatars0.githubusercontent.com/u/42487062?s=64) | [@shadowM8](https://github.com/shadowM8) | I want to generate random quotes to show on a daily basis for my school project |
| ![@AsafDavidov](https://avatars3.githubusercontent.com/u/29575862?s=64) | [@AsafDavidov](https://github.com/AsafDavidov) | Movie Trivia Game for the School I am studying at. |
| ![@suhanw](https://avatars2.githubusercontent.com/u/27381522?s=64) | [@suhanw](https://github.com/suhanw) | I'm integrating your API with and React.js and Redux framework. |
| ![@denisbobovnik](https://avatars1.githubusercontent.com/u/34263948?s=64) | [@denisbobovnik](https://github.com/denisbobovnik) | learning about APIs and making requests with Ruby : ) |

## 5. Copyright

Copyright © 2020 Juan Roldan. See [LICENSE.txt](https://github.com/juanroldan1989/movie_quotes/blob/master/LICENSE.txt) for further details.
