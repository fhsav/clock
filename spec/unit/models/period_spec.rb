require 'spec_helper'

describe Period do
  let(:period) { create(:period) }

  it { is_expected.to validate_presence_of :number }
  it { is_expected.to validate_presence_of :text }
  it { is_expected.to validate_presence_of :start }
  it { is_expected.to validate_presence_of :finish }

  it { expect(period).to be_valid }
end
