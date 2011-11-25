require "spec_helper"

describe "Period" do
  before(:all) do
    post "/admin/authenticate", :password => password
    @schedule = Schedule.create(:name => "Foo")
  end
  
  it "edit page should be ok" do
    period = Period.create(:text => "Foo", :start => "07:32", :finish => "08:14")
    @schedule.periods << period
    
    get "/admin/schedules/#{@schedule.id}/periods/edit/#{period.id}"
    
    last_response.should be_ok
  end
  
  it "creation should work" do
    # TODO
  end
  
  it "modification should work" do
    # TODO
  end
  
  it "deletion should work" do
    # TODO
  end
end
