require 'spec_helper'

describe "Schedule index" do
  
  before do
    post "/admin/authenticate", :password => @@yaml["password"]
  end
  
  it "should exist" do
    get "/admin/schedules"
    
    last_response.should be_ok
  end
  
end

describe "Schedule edit page" do

end
