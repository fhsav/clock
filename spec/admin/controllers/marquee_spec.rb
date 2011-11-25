require "spec_helper"

describe "Marquee" do
  before(:all) do
    post "/admin/authenticate", :password => password
  end
  
  it "index should be ok" do
    get "/admin/marquees"
    
    last_response.should be_ok
  end
  
  it "edit page should be ok" do
    marquee = Marquee.create(:text => "Foo to the bar.")
    
    get "/admin/marquees/edit/#{marquee.id}"
    last_response.should be_ok
  end
  
  it "creation should work" do
    post "/admin/marquees/create", :marquee => { :text => "Foo to the bar." }
    
    last_response.should be_redirect
  end
  
  it "modification should work" do
    marquee = Marquee.create(:text => "Foo to the bar.")
    
    put "/admin/marquees/modify", :id => marquee.id, :marquee => { :text => "Bar to the foo." }
    
    last_response.should be_redirect
  end
  
  it "deletion should work" do
    marquee = Marquee.create(:text => "Foo to the bar.")
    
    delete "/admin/marquees/destroy", :id => marquee.id
    
    last_response.should be_redirect
  end
end
