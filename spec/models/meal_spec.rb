require 'rails_helper'

describe Meal do

  let(:meal) {FactoryBot.create(:meal)}
  subject {meal}

  describe 'associations' do
    it { is_expected.to belong_to(:chef)}
    it { is_expected.to have_many(:dietary_accommodation)}
    it { is_expected.to have_many(:cuisine)}
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:short_name) }
    it { is_expected.to validate_presence_of(:description) }
  end


end
