require 'spec_helper'

describe Theme do
  let(:theme) { create(:theme) }

  it { should validate_presence_of(:name) }

  it { theme.should be_valid }

  describe '#wallpaper' do
    before do
      theme.wallpaper = File.open(Padrino.root('spec/fixtures/paris.jpg'), 'r')
    end

    it { theme.wallpaper.should_not be_nil }
    it { theme.wallpaper.should be_an_instance_of WallpaperUploader }
  end
end
