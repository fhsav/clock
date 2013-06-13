require 'spec_helper'

describe 'Clock' do
  describe 'GET /' do
    before do
      get '/', {}, 'rack.session' => { :clock => session_value }
    end

    context 'unauthenticated' do
      it { response.should be_redirect }
      it { response.location.should include '/clock' }
    end

    context 'authenticated' do
      it { response.should be_ok }
      it { response.should_not be_redirect }
    end
  end
end
