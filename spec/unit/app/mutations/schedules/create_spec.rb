require 'spec_helper'

describe Schedule::Create do
  let(:action) do
    Schedule::Create.run({
      :schedule => {
        :name => 'Foobar',
        :description => 'Foo to the bar.'
      }
    })
  end

  it { action.success?.should be_true }
  it { action.result.should be_an_instance_of Schedule }
  it { action.result.name.should eql 'Foobar' }
end
