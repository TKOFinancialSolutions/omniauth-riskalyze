omniauth-riskalyze
==============

[![Gem Version](https://badge.fury.io/rb/omniauth-riskalyze.png)](http://badge.fury.io/rb/omniauth-riskalyze)
[![Build Status](https://travis-ci.org/tmilewski/omniauth-riskalyze.png?branch=master)](https://travis-ci.org/tmilewski/omniauth-riskalyze)

Riskalyze OAuth2 Strategy for OmniAuth 1.x and supports the OAuth 2.0 server-side flow.

You may view the Riskalyze API documentation [here](https://developer.riskalyze.com/v1/auth/#oauth-2-0).

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

* `scope`: A comma-separated list of permissions you want to request from the user. The available permissions are as follows: `profile`, `history`.  Default: `profile`

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :riskalyze, ENV['RISKALYZE_CLIENT_ID'], ENV['RISKALYZE_CLIENT_SECRET'], :scope => 'profile,history'
end

```

## Scope Details

* `profile`:	Access the basic profile information on a user's Riskalyze account including their first name, email address, and profile picture.
* `history`:	Pull trip data including the locations, times, and product type of a user's historical pickups and drop-offs.

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'riskalyze',
  :uid => 'xxxxxx-yyyyy-zzzz-aaaa-bbbbbbbbbb',
  :info => {
    :email => 'foo@bar.com',
    :first_name => 'Tom',
    :last_name => 'Milewski',
    :picture => 'https://d1w2poirtb3as9.cloudfront.net/default.jpeg',
    :promo_code => 'xxxxx',
  },
  :credentials => {
    :token => 'ABCDEF...',
    :refresh_token => 'ABCDEF...',
    :expires => true
  },
  :extra => {
    :email => 'foo@bar.com',
    :first_name => 'Tom',
    :last_name => 'Milewski',
    :picture => 'https://d1w2poirtb3as9.cloudfront.net/default.jpeg',
    :promo_code => 'xxxxx',
    :uuid => 'xxxxxx-yyyyy-zzzz-aaaa-bbbbbbbbbb'
  }
}
```

## Supported Ruby Versions
`omniauth-riskalyze` is tested under 1.9.2, 1.9.3, 2.0.0, 2.1.0, MRI Ruby HEAD, JRuby (1.9 mode and HEAD), and Rubinius
(2.0 mode).

## Versioning
This library aims to adhere to [Semantic Versioning 2.0.0][semver]. Violations
of this scheme should be reported as bugs. Specifically, if a minor or patch
version is released that breaks backward compatibility, that version should be
immediately yanked and/or a new version should be immediately released that
restores compatibility. Breaking changes to the public API will only be
introduced with new major versions. As a result of this policy, you can (and
should) specify a dependency on this gem using the [Pessimistic Version
Constraint][pvc] with two digits of precision. For example:

    spec.add_dependency 'omniauth-riskalyze', '~> 1.0'

[semver]: http://semver.org/
[pvc]: http://docs.rubygems.org/read/chapter/16#page74


## License

Copyright (c) 2014 by Tom Milewski

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
