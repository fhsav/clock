require 'spec_helper'

describe Period do
  let(:period) { create(:period) }

  it { should validate_presence_of :number }
  it { should validate_presence_of :text }
  it { should validate_presence_of :start }
  it { should validate_presence_of :finish }

  it { period.should be_valid }
end
