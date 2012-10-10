require "spec_helper"

describe "API" do
  describe "GET /api/time.json" do
    before do
      get "/api/time.json"
    end

    it "should be ok" do
      response.should be_ok
    end

    it "should be JSON" do
      response.header["Content-Type"].should == "application/json;charset=utf-8"
    end
  end
end