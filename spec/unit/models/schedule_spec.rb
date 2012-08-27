require "spec_helper"

describe Schedule do
  let(:schedule) { Schedule.new(:name => "Foobar") }

  it "can be instantiated" do
    schedule.should_not be_nil
  end
end