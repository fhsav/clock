require "spec_helper"

describe "Refreshes" do
  describe "POST /refreshes" do # This is shite.
    before do
      get "/clock"

      @pre = response.body

      create(:marquee)

      post "/refreshes"

      get "/clock"

      @post = response.body
    end

    it "should work" do
      @pre.should_not == @post
    end
  end
end