require "spec_helper"

describe "Refreshes" do
  describe "POST /refreshes" do
    before do
      post "/refreshes", :redirect => "/"
    end

    it "should work" do
      response.should be_redirect
      response.location.should == "#{site}/"
    end
  end
end