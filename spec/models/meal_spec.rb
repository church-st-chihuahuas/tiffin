require 'rails_helper'

describe Meal do

  let(:meal) {FactoryBot.create(:meal)}
  subject {meal}

  describe 'associations' do
    it { is_expected.to belong_to(:chef)}
    it { is_expected.to have_and_belong_to_many(:cuisines)}
    it { is_expected.to have_and_belong_to_many(:dietary_accommodations)}
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:short_name) }
    it { is_expected.to validate_presence_of(:description) }
  end


end
