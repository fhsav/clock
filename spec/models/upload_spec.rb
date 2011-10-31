require 'spec_helper'

describe "Upload Model" do
  let(:upload) { Upload.new }
  it 'can be created' do
    upload.should_not be_nil
  end
end
