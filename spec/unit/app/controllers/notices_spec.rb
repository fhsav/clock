require "spec_helper"

describe "Notices" do
  before(:each) do
    @n = create(:notice)
  end

  describe "GET /noticees" do
    before do
      get "/notices"
    end

    it "should be ok" do
      response.should be_ok
    end
  end

  describe "POST /notices/create" do
    before do
      post "/notices/create", :notice => { :text => "Foo to the bar to the foo." }
    end

    it "should create a Notice" do
      Notice.find_by_text("Foo to the bar to the foo.").should_not be_nil
    end

    it "should redirect" do
      response.should be_redirect
      response.location.should == "#{site}/notices"
    end
  end

  describe "GET /notices/:id/edit" do
    before do
      get "/notices/#{@n.id}/edit"
    end

    it "should be ok" do
      response.should be_ok
    end
  end

  describe "PUT /notices/modify" do
    before do
      put "/notices/modify", :id => @n.id, :notice => { :text => "Carl Sagan!" }

      @n.reload
    end

    it "should modify a Notice" do
      @n.text.should == "Carl Sagan!"
    end

    it "should redirect correctly" do
      response.should be_redirect
      response.location.should == "#{site}/notices"
    end
  end

  describe "DELETE /notices/destroy" do
    before do
      delete "/notices/destroy", :id => @n.id
    end

    it "should destroy a Notice" do
      Notice.find(@n.id).should be_nil
    end

    it "should redirect correctly" do
      response.should be_redirect
      response.location.should == "#{site}/notices"
    end
  end
end