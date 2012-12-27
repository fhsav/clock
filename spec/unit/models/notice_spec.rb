require "spec_helper"

describe Notice do
  let(:notice) { create(:notice) }

  it { validate_presence_of(:text) }

  it { notice.should be_valid }

  describe "#format!" do
    it { notice.text.should eql("We are the legacy of 15 billion years of cosmic evolution.")}
  end
end