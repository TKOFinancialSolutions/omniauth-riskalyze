require 'spec_helper'

describe OmniAuth::Strategies::Riskalyze do
  subject do
    @subject ||= begin
      @options ||= {}
      args = ['client_id', 'client_secret', @options].compact
      OmniAuth::Strategies::Riskalyze.new(*args)
    end
  end

  context 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('riskalyze')
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://api.riskalyze.com')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://login.riskalyze.com/oauth/authorize')
    end

    it 'should have correct access token url' do
      expect(subject.options.client_options.token_url).to eq('https://login.riskalyze.com/oauth/token')
    end

    it 'should indicate that the provider ignores the state parameted' do
      expect(subject.options.provider_ignores_state).to eq false
    end
  end
end
