require 'spec_helper'

describe Notice do
  let(:notice) { create :notice }

  it { validate_presence_of :text }

  it { notice.should be_valid }

  describe "#format" do
    it { notice.text.should_not include("\n") }
  end
end