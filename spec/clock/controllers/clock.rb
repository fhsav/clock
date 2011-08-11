require 'spec_helper'

describe "Clock" do
  
  it "should exist" do
    get "/"
    
    last_response.shold be_ok
  end
  
  it "should respond to ping with pong" do
    get "/ping"
    
    last_response.body.should == "pong"
  end

end
