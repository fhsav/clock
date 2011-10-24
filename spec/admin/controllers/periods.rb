require 'spec_helper'

describe "Period API" do
  before(:all) do
    post "/admin/authenticate", :password => password
    schedule = Schedule.create(:name => "Derp")
  end
  
  it "creation API should work" do
    put '/admin/schedules/' + schedule.id + '/periods/create', :period => { :text => "Period 1", :start => "07:32", :finish => "08:14" }
    
    last_response.should be_redirect
  end
end
