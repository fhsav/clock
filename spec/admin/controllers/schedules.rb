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

  before do
    post "/admin/authenticate", :password => @@yaml["password"]
    
    let(:schedule) { Schedule.new(:name => "Foo") }
  end
  
  it "should exist" do
    get "/admin/schedules/edit/#{schedule.id}"
    
    last_response.should be_ok
  end

end

describe "Schedule API" do
  
  before do
    post "/admin/authenticate", :password => @@yaml["password"]
  end
  
  it "creation should work" do
    post "/admin/schedules/create", :schedule => { :name => "Foo", :description => "Bar" }
    
    last_response.should be_ok
  end
  
  it "editing should work" do
    let(:schedule) { Schedule.new(:name => "Foo") }
    
    put "/admin/schedules/modify", :schedule => { :name => "Foo", :description => "Bar" }
    
    last_response.should be_ok
  end
  
  it "deletion should work" do
    let(:schedule) { Schedule.new(:name => "Foo") }
    
    delete "/admin/schedules/destroy", :id => schedule.id
    
    last_response.should be_ok
  end
  
end
