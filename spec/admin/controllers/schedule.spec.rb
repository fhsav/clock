require "spec_helper"

describe "Schedule" do
  before(:all) do
    post "/admin/authenticate", :password => password
  end
  
  it "index should be ok" do
    get "/admin/schedules"
    
    last_response.should be_ok
  end
  
  it "edit page should be ok" do
    schedule = Schedule.create(:name => "Foo", :description => "Bar")
    
    get "/admin/schedules/edit/#{schedule.id}"
    
    last_response.should be_ok
  end
  
  it "creation should work" do
    post "/admin/schedules/create", :schedule => { :name => "Foo", :description => "Bar" }
    
    last_response.should be_redirect
  end
  
  it "modification should work" do
    schedule = Schedule.create(:name => "Foo", :description => "Bar")
    
    put "/admin/schedules/modify", :id => schedule.id, :schedule => { :name => "Bar", :description => "Foo" }
    
    last_response.should be_redirect
    last_response.location.should == "#{site}/admin/schedules/edit/#{schedule.id}"
  end
  
  it "deletion should work" do
    schedule = Schedule.create(:name => "Foo", :description => "Bar")
    
    delete "/admin/schedules/destroy", :id => schedule.id
    
    last_response.should be_redirect
    last_response.location.should == "#{site}/admin/schedules"
  end
end
