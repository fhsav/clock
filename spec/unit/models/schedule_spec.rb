require 'spec_helper'

describe Schedule do
  let(:schedule) { create(:schedule) }

  it { should validate_presence_of :name }

  it { schedule.should be_valid }

  describe '.activated' do
    before do
      schedule.active = true
      schedule.save
    end

    it { Schedule.activated.should eql schedule }
  end

  describe '#activate!' do
    let(:schedule2) { create(:schedule) }

    before do
      schedule2.active = true
      schedule2.save

      schedule.activate!

      schedule2.reload
    end

    it { schedule.active.should be_true }
    it { schedule2.active.should be_false }
  end
end
