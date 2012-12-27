require "spec_helper"

describe Schedule do
  let(:schedule) { create(:schedule) }

  it { validate_presence_of(:name) }

  it { schedule.should be_valid }

  describe ".activated" do
    before do
      schedule.active = true
      schedule.save
    end

    it { Schedule.activated.should eql(schedule) }
  end
end