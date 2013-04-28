require 'spec_helper'

describe Schedule do
  let(:schedule) { create(:schedule) }
  let(:active)   { create(:schedule, :active) }

  it { should validate_presence_of :name }

  it { schedule.should be_valid }

  describe '#activate' do
    before do
      schedule.activate!
    end

    it 'deactivates other schedules' do
      active.active.should be_false
    end

    it 'activates the instantiated schedule' do
      schedule.active.should be_true
    end
  end
end
