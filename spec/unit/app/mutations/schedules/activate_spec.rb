require 'spec_helper'

describe Schedule::Activate do
  let(:schedule) { create(:schedule) }
  let(:action) do
    Schedule::Activate.run({
      :schedule => {
        :id => schedule.id.to_s
      }
    })
  end

  it { action.success?.should be_true }
  it { action.result.active.should be_true }
end
