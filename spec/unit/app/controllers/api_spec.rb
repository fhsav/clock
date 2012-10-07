require "spec_helper"

describe "API" do
  describe "GET /api/time.json" do
    before do
      get "/api/time.json"
    end

    it "should be ok" do
      response.should be_ok
    end

    it "should return a time" do
    	response.body.should == "{\"ms\":#{((Time.now.to_f * 1000.0).to_i) - 1}}"
    end
  end
end