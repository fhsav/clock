require 'spec_helper'

describe "Schedule Model" do
  let(:schedule) { Schedule.new }
  it 'can be created' do
    schedule.should_not be_nil
  end
end
