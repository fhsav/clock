require "spec_helper"

describe "Clock" do
  describe "GET /clock" do
    before do
      get "/clock"
    end

    it "should be ok" do
      response.should be_ok
    end
  end
end