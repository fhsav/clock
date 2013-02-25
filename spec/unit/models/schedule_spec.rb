require 'spec_helper'

describe Schedule do
  let(:schedule) { create(:schedule) }

  it { validate_presence_of(:title) }

  it { schedule.should be_valid }

  describe ".activated" do
    before do
      schedule.active = true
      schedule.save
    end

    it { Schedule.activated.should eql(schedule) }
  end

  describe "#activate!" do
    let(:old) { create(:schedule, :activated) }

    before do 
      schedule.activate!

      schedule.reload
      old.reload
    end

    it { old.active.should be_false }
    it { schedule.active.should be_true }
    it { Schedule.activated.should eql(schedule) }
  end
end