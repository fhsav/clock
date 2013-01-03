require 'spec_helper'

describe Marquee do
  let(:marquee) { create(:marquee) }

  it { marquee.should be_valid }
end