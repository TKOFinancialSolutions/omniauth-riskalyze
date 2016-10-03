require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Riskalyze < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'profile'

      option :client_options, {
          site: 'https://api.riskalyze.com',
          authorize_url: 'https://pro.riskalyze.com/oauthconnect',
          token_url: 'https://api2.riskalyze.com/ap/v1/oauthpro/token'
      }

      uid { raw_info['uuid'] }

      info do
        {
            first_name: raw_info['first_name'],
            last_name: raw_info['last_name'],
            email: raw_info['email'],
            picture: raw_info['picture'],
            promo_code: raw_info['promo_code']
        }
      end

      extra do
        {
            raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/v1/me').parsed || {}
      end

      def request_phase
        options[:authorize_params] = {
            client_id: options['client_id'],
            response_type: 'code',
        }

        options[:authorize_params][:scope] = options['scope'] unless options['scope'].to_s.nil?
        options[:authorize_params][:redirect_uri] = options['redirect_uri'] unless options['redirect_uri'].to_s.nil?

        super
      end
    end
  end
end
