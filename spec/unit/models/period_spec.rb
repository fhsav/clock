require "spec_helper"

describe Period do
  let(:period)   { create(:period) }
  let(:schedule) { period.schedule }

  it { validate_presence_of(:number) }
  it { validate_presence_of(:name) }
  it { validate_presence_of(:start) }
  it { validate_presence_of(:finish) }

  it { period.should be_valid }
end