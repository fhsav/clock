require "spec_helper"

describe "Marquees" do
  before(:each) do
    @m = create(:marquee)
  end

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
      post "/marquees/create", :marquee => { :text => "Foo to the bar to the foo." }
    end

    it "should create a Marquee" do
      Marquee.find_by_text("Foo to the bar to the foo.").should_not be_nil
    end

    it "should redirect" do
      response.should be_redirect
      response.location.should == "#{site}/marquees"
    end
  end

  describe "GET /marquees/:id/edit" do
    before do
      get "/marquees/#{@m.id}/edit"
    end

    it "should be ok" do
      response.should be_ok
    end
  end

  describe "PUT /marquees/modify" do
    before do
      put "/marquees/modify", :id => @m.id, :marquee => { :text => "Carl Sagan!" }

      @m.reload
    end

    it "should modify a Marquee" do
      @m.text.should == "Carl Sagan!"
    end

    it "should redirect correctly" do
      response.should be_redirect
      response.location.should == "#{site}/marquees"
    end
  end

  describe "DELETE /marquees/destroy" do
    before do
      delete "/marquees/destroy", :id => @m.id
    end

    it "should destroy a Marquee" do
      Marquee.find(@m.id).should be_nil
    end

    it "should redirect correctly" do
      response.should be_redirect
      response.location.should == "#{site}/marquees"
    end
  end
end