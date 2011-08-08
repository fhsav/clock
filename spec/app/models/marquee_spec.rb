require 'spec_helper'

describe "Marquee Model" do
  let(:marquee) { Marquee.new }
  it 'can be created' do
    marquee.should_not be_nil
  end
end
