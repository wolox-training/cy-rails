require 'rails_helper'

RSpec.describe Book do
  it { is_expected.to validate_presence_of(:genre) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:publisher) }
  it { is_expected.to validate_presence_of(:year) }

  subject(:book) { build(:book) }

  context 'When the genre is nil' do
    let(:genre) { nil }
    it { is_expected.to be_valid }
  end

  context 'When the author is valid' do
    it { is_expected.to be_valid }
  end

  context 'When the title is valid' do
    it { is_expected.to be_valid }
  end

  context 'When the publisher is valid' do
    it { is_expected.to be_valid }
  end

  context 'When the year is valid' do
    it { is_expected.to be_valid }
  end
end
