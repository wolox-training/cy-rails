require 'rails_helper'

RSpec.describe User do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  subject(:user) { build(:user) }

  context 'When the first_name is valid' do
    it { is_expected.to be_valid }
  end

  context 'When the last_name is valid' do
    it { is_expected.to be_valid }
  end
end
