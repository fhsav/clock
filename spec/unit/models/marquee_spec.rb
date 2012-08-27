require "spec_helper"

describe Marquee do
  let(:marquee) { Marquee.new(:text => "Foo to the bar.") }

  it "can be instantiated" do
    marquee.should_not be_nil
  end
end