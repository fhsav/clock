require 'spec_helper'

describe Theme do
  let(:theme) { create(:theme) }

  it { is_expected.to validate_presence_of :name }

  it { expect(theme).to be_valid }

  describe '.activated' do
    before do
      theme.active = true
      theme.save
    end

    it { expect(Theme.activated).to eql theme }
  end

  describe '#activate!' do
    let(:theme2) { create(:theme) }

    before do
      theme2.active = true
      theme2.save

      theme.activate!

      theme2.reload
    end

    it { expect(theme.active).to be true }
    it { expect(theme2.active).to be false }
  end

  describe '#wallpaper' do
    before do
      theme.wallpaper = File.open(Padrino.root('spec/fixtures/paris.jpg'), 'r')
    end

    it { expect(theme.wallpaper).not_to be_nil }
    it { expect(theme.wallpaper).to be_an_instance_of WallpaperUploader }
  end
end
