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
