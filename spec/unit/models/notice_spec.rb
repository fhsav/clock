require "spec_helper"

describe Notice do
  let(:notice) { Notice.new(:text => "Foo to the bar.") }

  it "can be instantiated" do
    notice.should_not be_nil
  end
end