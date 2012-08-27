require "spec_helper"

describe "Clock" do
  describe "GET /clock" do
    before do
      get "/clock"
    end

    it "should redirect" do
      response.should be_redirect
      response.location.should == "#{site}/clock/beta"
    end
  end

  describe "GET /clock/beta" do
    before do
      get "/clock/beta"
    end

    it "should be ok" do
      response.should be_ok
    end
  end
end