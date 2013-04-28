require 'spec_helper'

describe Notice do
  let(:notice) { create(:notice) }

  it { should validate_presence_of :text }

  it { notice.should be_valid }

  describe '#format' do
    it 'removes whitespace' do
      notice.text.should_not include "/n"
    end
  end
end
