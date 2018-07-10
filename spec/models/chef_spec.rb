require 'rails_helper'

describe Chef do

  let(:chef) {FactoryBot.create(:chef)}
  subject {chef}

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it {is_expected.to have_many(:meals)}
    it {is_expected.to have_and_belong_to_many(:certification)}
    it {is_expected.to have_and_belong_to_many(:dietary_accommodation)}
    it {is_expected.to have_and_belong_to_many(:cuisine)}

  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:business_name) }
    it { is_expected.to validate_presence_of(:business_description) }
  end


end
