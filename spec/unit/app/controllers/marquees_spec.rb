require "spec_helper"

describe "Marquees" do
  describe "GET /marqueees" do
    before do
      get "/marquees"
    end

    it "should be ok" do
      response.should be_ok
    end
  end

  describe "POST /marquees/create" do
    before do
      post "/marquees", :marquee => { :text => "Foo to the bar to the foo." }
    end

    it "should create a Marquee" do
      Marquee.find_by_text("Foo to the bar to the foo.").should_not be_nil
    end

    it "should redirect" do
      response.should be_redirect
      response.location.should == "/marquees"
    end
  end
end