require "spec_helper"

describe "Schedules" do
  before(:each) do
    @s = Schedule.create(:name => "Foobar")
  end

  describe "GET /schedules" do
    before do
      get "/schedules"
    end

    it "should be ok" do
      response.should be_ok
    end
  end

  describe "POST /schedules/create" do
    before do

      post "/schedules/create", :schedule => { :name => "Barfoo" }
    end

    it "should create a Schedule" do
      Schedule.find_by_name("Barfoo").should_not be_nil
    end
  end

  describe "GET /schedules/:id" do
    before do
      get "/schedules/#{@s.id}"
    end

    it "should be ok" do
      response.should be_ok
    end
  end

  describe "POST /schedules/activate" do
    before do
      @s2 = Schedule.create(:name => "Activated")

      post "/schedules/activate", :id => @s.id

      @s.reload
      @s2.reload
    end

    it "should activate a Schedule" do
      @s.active.should be_true
      @s2.active.should be_false
    end

    it "should redirect correctly" do
      response.should be_redirect
      response.location.should == "#{site}/schedules"
    end
  end

  describe "DELETE /schedules/destroy" do
    before do
      delete "/schedules/destroy", :id => @s.id
    end

    it "should destroy a Schedule" do
      Schedule.find(@s.id).should be_nil
    end

    it "should redirect correctly" do
      response.should be_redirect
      response.location.should == "#{site}/schedules"
    end
  end

  describe "Periods" do
    before(:each) do
      @p = Period.create(:text => "Foobar", :start => "07:32", :finish => "08:14")
      @s.periods << @p

      @p.reload
      @s.reload
    end

    describe "POST /schedules/:schedule_id/periods/create" do
      before do
        post "/schedules/#{@s.id}/periods/create", :period => { :text => "Barfoo", :start => "07:32", :finish => "08:14" }

        @s.reload
      end

      it "creates a Period" do
        Period.find_by_text("Barfoo").should_not be_nil
      end

      it "should redirect correctly" do
        response.should be_redirect
        response.location.should == "#{site}/schedules/#{@s.id}"
      end
    end

    describe "GET /schedules/:schedule_id/periods/:id/edit" do
      before do
        get "/schedules/#{@s.id}/periods/#{@p.id}/edit"
      end

      it "should be ok" do
        response.should be_ok
      end
    end

    describe "PUT /schedules/:schedule_id/periods/modify" do
      before do
        put "/schedules/#{@s.id}/periods/modify", :id => @p.id, :period => { :text => "Blah" }

        @p.reload
      end

      it "should modify a Period" do
        @p.text.should == "Blah"
      end

      it "should redirect correctly" do
        response.should be_redirect
        response.location.should == "#{site}/schedules/#{@s.id}"
      end
    end

    describe "DELETE /schedules/:schedule_id/periods/destroy" do
      before do
        delete "/schedules/#{@s.id}/periods/destroy", :id => @p.id
      end

      it "should destroy a Period" do
      end

      it "should redirect correctly" do
        response.should be_redirect
        response.location.should == "#{site}/schedules/#{@s.id}"
      end
    end
  end
end