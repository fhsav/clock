require 'spec_helper'

describe Period do
  let(:schedule) { create(:schedule) }

  it { validate_presence_of(:number) }
  it { validate_presence_of(:text) }
  it { validate_presence_of(:start) }
  it { validate_presence_of(:finish) }

  it { schedule.periods.first.should be_valid }

  describe "#number!" do
    it { schedule.periods.first.number.should eql(1) }
  end
end