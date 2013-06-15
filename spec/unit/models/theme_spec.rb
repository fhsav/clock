require 'spec_helper'

describe Theme do
  let(:theme) { create(:theme) }

  it { should validate_presence_of(:name) }

  it { theme.should be_valid }

  describe '.activated' do
    before do
      theme.active = true
      theme.save
    end

    it { Theme.activated.should eql theme }
  end

  describe '#activate!' do
    let(:theme2) { create(:theme) }

    before do
      theme2.active = true
      theme2.save

      theme.activate!

      theme2.reload
    end

    it { theme.active.should be_true }
    it { theme2.active.should be_false }
  end

  describe '#wallpaper' do
    before do
      theme.wallpaper = File.open(Padrino.root('spec/fixtures/paris.jpg'), 'r')
    end

    it { theme.wallpaper.should_not be_nil }
    it { theme.wallpaper.should be_an_instance_of WallpaperUploader }
  end
end
