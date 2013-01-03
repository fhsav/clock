require 'spec_helper'

describe Marquee do
  let(:marquee) { create :marquee }

  it { validate_presence_of :text }

  it { marquee.should be_valid }

  describe "#format" do
    it { marquee.text.should_not include("\n") }
  end
end