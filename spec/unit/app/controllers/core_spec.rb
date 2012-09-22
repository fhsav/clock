require "spec_helper"

describe "Core" do
  describe "GET /" do
    before do
      get "/"
    end

    it "should redirect without a session" do
      response.should be_redirect
      response.location.should == "#{site}/clock"
    end
  end
end