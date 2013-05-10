require 'spec_helper'

describe Period::Create do
  let(:schedule) { create(:schedule) }
  let(:action) do
    Period::Create.run({
      :schedule => {
        :id => schedule.id.to_s
      },
      :period => {
        :number => 1,
        :text => 'Period 1',
        :start => '07:32',
        :finish => '08:14'
      }
    })
  end

  it { action.success?.should be_true }
  it { action.result.should be_an_instance_of Period }
end
