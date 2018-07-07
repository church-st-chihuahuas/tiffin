require 'rails_helper'

describe Chef do

  let(:chef) {FactoryBot.create(:chef)}
  subject {chef}

  describe 'associations' do

  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:business_name) }
    it { is_expected.to validate_presence_of(:business_description) }
  end


end
