require 'spec_helper'

describe Notice do
  let(:notice) { create(:notice) }

  it { is_expected.to validate_presence_of :text }

  it { expect(notice).to be_valid }

  describe '#format' do
    it 'removes whitespace' do
      expect(notice.text).not_to include "/n"
    end
  end
end
