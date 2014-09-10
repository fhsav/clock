require 'spec_helper'

describe Schedule do
  let(:schedule) { create(:schedule) }

  it { is_expected.to validate_presence_of :name }

  it { expect(schedule).to be_valid }

  describe '.activated' do
    before do
      schedule.active = true
      schedule.save
    end

    it { expect(Schedule.activated).to eql schedule }
  end

  describe '#activate!' do
    let(:schedule2) { create(:schedule) }

    before do
      schedule2.active = true
      schedule2.save

      schedule.activate!

      schedule2.reload
    end

    it { expect(schedule.active).to be true }
    it { expect(schedule2.active).to be false }
  end
end
