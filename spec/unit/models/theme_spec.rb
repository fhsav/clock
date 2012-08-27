require "spec_helper"

describe Theme do
  let(:theme) { Theme.new(:name => "Paris", :wallpaper => file) }

  it "can be instantiated" do
    theme.should_not be_nil
  end
end