omniauth-riskalyze
==============

[![Gem Version](https://badge.fury.io/rb/omniauth-riskalyze.png)](http://badge.fury.io/rb/omniauth-riskalyze)

Riskalyze OAuth2 Strategy for OmniAuth 1.x and supports the OAuth 2.0 server-side flow.

You may view the Riskalyze API documentation [here](https://developers.riskalyze.com/intro/).

## Installation

Add to your `Gemfile`:

```ruby
gem 'omniauth-riskalyze'
```

Then `bundle install`.


## Usage

`OmniAuth::Strategies::Riskalyze` is simply Rack middleware. Read the OmniAuth 1.0 docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :riskalyze, ENV['RISKALYZE_CLIENT_ID'], ENV['RISKALYZE_CLIENT_SECRET']
end
```

## Configuration

Currently, there is only one configuration option that needs to be set:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :riskalyze, ENV['RISKALYZE_CLIENT_ID'], ENV['RISKALYZE_CLIENT_SECRET']
end

```