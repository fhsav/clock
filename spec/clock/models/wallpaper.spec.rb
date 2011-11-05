require "spec_helper"

describe "Wallpaper model" do
  let(:wallpaper) { Wallpaper.new(:name => "Foobar", :file => file) }
  
  it "can be created" do
    wallpaper.should_not be_nil
  end
  
end
