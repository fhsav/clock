require 'spec_helper'

describe "Wallpaper" do
  before(:all) do
    post "/admin/authenticate", :password => password
  end
  
  it "index should be ok" do
    get "/admin/wallpapers"
    
    last_response.should be_ok
  end
  
  it "creation should work" do
    post "/admin/wallpapers/create", :wallpaper => { :name => "Foo", :file => file }
    
    last_response.should be_redirect
  end
  
  it "creation (of 2) should work" do
    post "/admin/wallpapers/create", :wallpaper => { :name => "Foo", :file => file }
    post "/admin/wallpapers/create", :wallpaper => { :name => "Bar", :file => file2 }
    
    w1 = Wallpaper.find_by_name("Foo")
    w2 = Wallpaper.find_by_name("Bar")
    
    w1.should_not be_nil
    w2.should_not be_nil
  end
  
  it "creation (of 2, without Padrino) should work" do
    w1 = Wallpaper.new(:name => "Foo", :file => file)
    w2 = Wallpaper.new(:name => "Bar", :file => file2)
    
    w1 = Wallpaper.find_by_name("Foo")
    w2 = Wallpaper.find_by_name("Bar")
    
    w1.should_not be_nil
    w2.should_not be_nil
  end
  
  it "activation should work" do
    post "/admin/wallpapers/create", :wallpaper => { :name => "Foo", :file => file }
    wallpaper = Wallpaper.find_by_name("Foo")
    
    post "/admin/wallpapers/activate", :id => wallpaper.id
    
    last_response.should be_redirect
  end
  
  it "deletion should work" do
    post "/admin/wallpapers/create", :wallpaper => { :name => "Foo", :file => file }
    wallpaper = Wallpaper.find_by_name("Foo")
    
    delete "/admin/wallpapers/destroy", :id => wallpaper.id
    
    last_response.should be_redirect
  end
end
