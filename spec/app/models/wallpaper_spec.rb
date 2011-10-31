require 'spec_helper'

describe "Wallpaper Model" do
  let(:wallpaper) { Wallpaper.new }
  it 'can be created' do
    wallpaper.should_not be_nil
  end
end
