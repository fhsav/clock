require "spec_helper"

describe "Schedule model" do
  let(:schedule) { Schedule.new }
  let(:period) { Period.new }
  
  it "can be created" do
    schedule.should_not be_nil
  end
  
  it "can have periods be added to it" do
    schedule.periods << period
    
    schedule.periods.should_not be_nil
  end
end
