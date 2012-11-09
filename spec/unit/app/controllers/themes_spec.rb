require "spec_helper"

describe "Themes" do
  before(:each) do
    @t = Theme.create(:name => "Paris")
  end

  describe "GET /themes" do
    before do
      get "/themes"
    end

    it "should be ok" do
      response.should be_ok
    end
  end

  describe "POST /themes/create" do
    before do
      post "/themes/create", :theme => { :name => "Paris" }, :wallpaper => file
    end

    it "should create a Theme" do
      Theme.find_by_name("France").should_not be_nil
    end

    it "should redirect" do
      response.should be_redirect
      response.location.should == "#{site}/themes"
    end
  end

  describe "GET /themes/:id" do
    before do
      @t.wallpaper = file

      get "/themes/#{@t.id}"
    end

    it "should be ok" do
      response.should be_ok
    end
  end

  describe "POST /themes/activate" do
    before do
      @t2 = Theme.create(:name => "Activated", :active => true)

      post "/themes/activate", :id => @t.id

      @t.reload
      @t2.reload
    end

    it "should activate a Theme" do
      @t.active.should be_true
      @t2.active.should be_false
    end

    it "should redirect correctly" do
      response.should be_redirect
      response.location.should == "#{site}/themes"
    end
  end

  describe "DELETE /themes/destroy" do
    before do
      delete "/themes/destroy", :id => @t.id
    end

    it "should destroy a Theme" do
      Theme.find(@t.id).should be_nil
    end

    it "should redirect correctly" do
      response.should be_redirect
      response.location.should == "#{site}/themes"
    end
  end
end