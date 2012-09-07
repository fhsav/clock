require "spec_helper"

describe "Settings" do
  describe "GET /settings" do
    before do
      get "/settings"
    end

    it "should be ok" do
      response.should be_ok
    end
  end
end