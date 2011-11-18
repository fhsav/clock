require "spec_helper"

describe "Admin core" do
  it "should not be accessible without password" do
    get "/admin"
    
    last_response.location.should == "#{site}/admin/login"
  end
  
  it "should be accessible with password" do
    post "/admin/authenticate", :password => password
    
    last_response.location.should == "#{site}/admin/"
  end
  
  it "home should be ok" do
    post "/admin/authenticate", :password => password
    get "/admin"
    
    last_response.should be_ok
  end
  
  it "login should be ok" do
    get "/admin/login"
    
    last_response.should be_ok
  end
end
