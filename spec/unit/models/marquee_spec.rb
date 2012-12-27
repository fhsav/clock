require "spec_helper"

describe Marquee do
  let(:marquee) { create(:marquee) }

  it { validate_presence_of(:text) }

  it { marquee.should be_valid }

  describe "#format!" do
    it { marquee.text.should eql("We are the legacy of 15 billion years of cosmic evolution.")}
  end
end