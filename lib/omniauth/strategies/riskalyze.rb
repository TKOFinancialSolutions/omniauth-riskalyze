require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Riskalyze < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, 'riskalyze'

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
          site: 'https://api.riskalyze.com',
          authorize_url: 'https://pro.riskalyze.com/oauthconnect',
          token_url: 'https://api2.riskalyze.com/ap/v1/oauthpro/token'
      }
    end
  end
end
