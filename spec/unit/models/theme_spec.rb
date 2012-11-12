require "spec_helper"

describe Theme do
  let(:theme) { Theme.create(:name => "Paris", :active => true) }

  before(:all) do
    theme.wallpaper = file
  end

  it "can be instantiated" do
    theme.should_not be_nil
  end

  it "wallpaper can be added" do
    theme.wallpaper.should_not be_blank
  end

  it "wallpaper is uploaded to S3" do
    S3.files.get("paris.jpg").should_not be_nil
  end
end