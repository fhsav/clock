require 'spec_helper'

describe "Marquee API" do
  before do
    get "/api/marquee.json"
  end
  
  it "should be ok" do
    last_response.should be_ok
  end
  
  it "should be JSON" do
    last_response.content_type.should == "application/json;charset=utf-8"
  end
end

describe "Period API" do
  before do
    get "/api/periods.json"
  end
  
  it "should be ok" do
    last_response.should be_ok
  end
  
  it "should be JSON" do
    last_response.content_type.should == "application/json;charset=utf-8"
  end
end

describe "Notice API" do
  before do
    get "/api/notices.json"
  end
  
  it "should be ok" do
    last_response.should be_ok
  end
  
  it "should be JSON" do
    last_response.content_type.should == "application/json;charset=utf-8"
  end
end
