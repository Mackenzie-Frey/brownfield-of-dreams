# README

## Description

<!-- Rails Engine is a 7-day solo project, during module three, of Turing School's Backend Engineering Program. The application utilizes the languages of Ruby, ActiveRecord, SQL, and the web framework of Rails to deliver Fast JSON-formatted data. A rake task was utilized to import CSV files and to create the corresponding records in the PostgreSQL database. -->

This is a Ruby on Rails application used to organize YouTube content used for online learning. Each tutorial is a playlist of video segments. Within the application an admin is able to create tags for each tutorial in the database. A visitor or registered user can then filter tutorials based on these tags.

A visitor is able to see all of the content on the application but in order to bookmark a segment they will need to register. Once registered a user can bookmark any of the segments in a tutorial page.

This is the base repo for a brownfield project used at Turing for Backend Mod 3.

## Schema
<!-- ![Alt text](./public/schema_diagram.png?raw=true "Database Schema") -->

### Project Board

Students will continue to build on the existing code base using the cards within the following Github Project: https://github.com/turingschool-examples/brownfield-of-dreams/projects/1

## Local Setup

First you'll need to setup an API key with YouTube and have it defined within `ENV['YOUTUBE_API_KEY']`. There will be one failing spec if you don't have this set up.

Clone down the repo
```
$ git clone
```

Install the gem packages
```
$ bundle install
```

Install node packages for stimulus
```
$ brew install node
$ brew install yarn
$ yarn add stimulus
```

Set up the database
```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

Run the test suite:
```ruby
$ bundle exec rspec
```

## Built Utilizing
* [Stimulus](https://github.com/stimulusjs/stimulus)
* [will_paginate](https://github.com/mislav/will_paginate)
* [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
* [webpacker](https://github.com/rails/webpacker)
* [vcr](https://github.com/vcr/vcr)
* [selenium-webdriver](https://www.seleniumhq.org/docs/03_webdriver.jsp)
* [chromedriver-helper](http://chromedriver.chromium.org/)
* Ruby 2.4.1
* Rails 5.2.0
* RSpec
* Pry
* FactoryBot
* SimpleCov
* RoboCop
* Postman
* Waffle.io
* GitHub

#### [Project Specification & Evaluation Rubric](https://github.com/turingschool-examples/brownfield-of-dreams)
