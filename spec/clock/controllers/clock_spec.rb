require "spec_helper"

describe "Clock" do
  before(:all) do
    @m = Factory(:marquee)
    @n = Factory(:notice)
    @s = Factory(:schedule)
  end
  
  it "should work" do
    Wallpaper.create(:name => "Foobar", :file => file, :active => true)
    
    get "/"
    
    response.should be_ok
  end
  
   it "should have the correct content", :js => true do
    @p = @s.periods << Factory(:period)
    
    visit "/"
    
    page.has_selector?("ul#marquee li", :text => "Foo to the bar.")
    page.has_selector?("ol#notices li", :text => "Foo to the bar to the foo.")
    page.has_selector?("ol#periods li", :text => "Foobar: 7:32&mdash;8:14")
  end
  
  it "schedule should not be visible if after last period" do
    @p = @s.periods << Period.create(:name => "Foobar", :start => Time.now - 3600, :finish => Time.now - 2400)
    
    visit "/"
    
    element_visible?("#after")
  end
  
  it "schedule should be visible if before last period" do
    @p = @s.periods << Period.create(:name => "Foobar", :start => Time.now - 3600, :finish => Time.now + 3600)
    
    visit "/"
    
    element_visible?("ol#periods")
  end
  
  it "should ping" do
    visit "/ping"
    
    page.should have_content("pong")
  end
end
