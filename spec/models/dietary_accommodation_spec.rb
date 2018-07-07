require 'rails_helper'

describe DietaryAccommodation do

  let(:dietary_accommodation) {FactoryBot.create(:dietary_accommodation)}
  subject {dietary_accommodation}

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:meal)}
    it { is_expected.to have_and_belong_to_many(:chef)}
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end


end