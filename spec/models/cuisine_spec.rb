require 'rails_helper'

describe Cuisine do

  let(:cuisine) {FactoryBot.create(:cuisine)}
  subject {cuisine}

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:meal)}
    it { is_expected.to have_and_belong_to_many(:chef)}
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end


end
