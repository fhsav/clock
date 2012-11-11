require "spec_helper"

describe Period do
  let(:schedule) { Schedule.new(:name => "Foobar") }
  let(:period)   { Period.new(:text => "Barfoo", :start => "07:32", :finish => "08:14") }

  it "can be instantiated" do
    period.should_not be_nil
  end

  it "can be added to a Schedule" do
    schedule.periods << period
    schedule.save

    schedule.periods.should_not be_blank
    period.schedule_id.should == schedule.id
  end
end