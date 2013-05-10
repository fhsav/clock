require 'spec_helper'

describe Schedule::Update do
  let(:schedule) { create(:schedule) }
  let(:action) do
    Schedule::Update.run({
      :schedule => {
        :id => schedule.id.to_s,
        :name => 'Barfoo',
        :description => 'Bar to the foo.',
      }
    })
  end

  it { action.success?.should be_true }
  it { action.result.should be_an_instance_of Schedule }
  it { action.result.name.should eql 'Barfoo' }
end
