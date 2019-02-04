# Spotify Fetch Artists

Spotify Fetch Artists is a simple Rails API which handles Authentication with Spotify API and queries all the artists which current user follows.

## Getting Started

### Installing

To install all the dependencies, you should type the following command at the root folder:

```
bundle install
```

Next, you must create the db and migrate all the pending migrations w/ the following command:

```
rails db:create db:migrate
```

When finished, just type:

```
rails server (or rails s)
```

to run the server.

## Running the tests

All tests located at this repo use [RSpec Gem](https://github.com/rspec/rspec-rails).
To run all test, type:

```
bundle exec rspec spec
```
**bundle exec** is necessary to execute the current version of gem located inside Gemfile.

## Deployment

Spotify Fetch Artists is deployed using [Heroku](https://www.heroku.com/) and is hosted [here](https://spotify-api-artists-only.herokuapp.com/).
