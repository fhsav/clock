require "spec_helper"

describe "Core" do
  describe "GET /" do
    before do
      get "/"
    end

    it "should redirect without a session" do
      response.should_not be_nil
    end
  end
end