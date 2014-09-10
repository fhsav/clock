require 'spec_helper'

describe Marquee do
  let(:marquee) { create(:marquee) }

  it { is_expected.to validate_presence_of :text }

  it { expect(marquee).to be_valid }

  describe '#format' do
    it 'removes whitespace' do
      expect(marquee.text).not_to include "/n"
    end
  end
end
