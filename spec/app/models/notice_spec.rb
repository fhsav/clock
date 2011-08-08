require 'spec_helper'

describe "Notice Model" do
  let(:notice) { Notice.new }
  it 'can be created' do
    notice.should_not be_nil
  end
end
