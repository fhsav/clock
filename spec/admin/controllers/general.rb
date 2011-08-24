require 'spec_helper'

describe "Admin" do

  it "should not allow access without password" do
    get "/admin"
    
    last_response.should be_redirect
  end
  
  it "should work with correct password" do
    post "/admin/authenticate", :password => @@yaml["password"]
    
    get "/admin"
    
    last_response.should_not be_redirect
    last_response.should be_ok
  end
  
  it "should not work without correct password" do
    post "/admin/authenticate", :password => "derp"
    
    get "/admin"
    
    last_response.should be_redirect
  end

end
