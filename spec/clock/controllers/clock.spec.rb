require "spec_helper"

describe "Clock" do
  it "should work" do
    Wallpaper.create(:name => "Foobar", :file => file, :active => true)
    
    get "/"
    
    last_response.should be_ok
  end
  
  it "should ping" do
    get "/ping"
    
    last_response.body.should == "pong"
  end
end
