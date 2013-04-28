require 'spec_helper'

describe Marquee do
  let(:marquee) { create(:marquee) }

  it { should validate_presence_of :text }

  it { marquee.should be_valid }

  describe '#format' do
    it 'removes whitespace' do
      marquee.text.should_not include "/n"
    end
  end
end
