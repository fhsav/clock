require 'spec_helper'

describe "Schedule" do
  before(:all) do
    post "/admin/authenticate", :password => password
  end
  
  it "index should exist" do
    get "/admin/schedules"
    
    last_response.should be_ok
  end
  
  it "edit page should exist" do
    schedule = Schedule.create(:name => "Derp")
    
    get "/admin/schedules/edit/#{schedule.id}"
    
    last_response.should be_ok
  end
  
  it "creation API should work" do
    post "/admin/schedules/create", :schedule => { :name => "Derp" }
    
    last_response.should be_redirect
  end
  
  it "modification API should work" do
    schedule = Schedule.create(:name => "Derp")
  
    put "/admin/schedules/modify", :id => schedule.id, :schedule => { :name => "Herp" }
    
    last_response.should be_redirect
  end
  
  it "deletion API should work" do
    schedule = Schedule.create(:name => "Derp")
    
    delete "/admin/schedules/destroy", :id => schedule.id
    
    last_response.should be_redirect
  end
end
