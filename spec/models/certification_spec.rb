require 'rails_helper'

describe Certification do

  let(:certification) {FactoryBot.create(:certification)}
  subject {certification}

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:chef)}
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:authority) }
    it { is_expected.to validate_presence_of(:url) }
  end


end