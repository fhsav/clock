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
  
  it "refresh should be ok" do
    m = Marquee.create(:text => "Foo to the bar.")
    
    visit "/"
    page.has_selector?("ul#marquee li", :text => "Foo to the bar.")
    
    put "/admin/marquees/modify", :id => m.id, :marquee => { :text => "Bar to the foo." }
    post "/admin/refresh"
    
    visit "/"
    page.has_selector?("ul#marquee li", :text => "Bar to the foo.")
  end
end
