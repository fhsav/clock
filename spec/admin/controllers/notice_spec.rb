require "spec_helper"

describe "Notice" do
  before(:all) do
    post "/admin/authenticate", :password => password
  end
  
  it "index should be ok" do
    get "/admin/notices"
    
    last_response.should be_ok
  end
  
  it "edit page should be ok" do
    notice = Notice.create(:text => "Foo to the bar.")
    
    get "/admin/notices/edit/#{notice.id}"
    last_response.should be_ok
  end
  
  it "creation should work" do
    post "/admin/notices/create", :notice => { :text => "Foo to the bar." }
    
    last_response.should be_redirect
  end
  
  it "modification should work" do
    notice = Notice.create(:text => "Foo to the bar.")
    
    put "/admin/notices/modify", :id => notice.id, :notice => { :text => "Bar to the foo." }
    
    last_response.should be_redirect
  end
  
  it "deletion should work" do
    notice = Notice.create(:text => "Foo to the bar.")
    
    delete "/admin/notices/destroy", :id => notice.id
    
    last_response.should be_redirect
  end
end
