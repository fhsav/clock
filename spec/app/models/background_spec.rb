require 'spec_helper'

describe "Background Model" do
  let(:background) { Background.new }
  it 'can be created' do
    background.should_not be_nil
  end
end
