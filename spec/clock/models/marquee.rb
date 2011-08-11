require 'spec_helper'

describe "Marquee model" do
  let(:marquee) { Marquee.new }
  
  it "can be created" do
    marquee.should_not be_nil
  end
  
end
