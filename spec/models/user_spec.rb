require 'rails_helper'

describe User do

  let(:user) {FactoryBot.build(:user)}
  subject {user}

  describe 'associations' do

  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:role) }
    it { should define_enum_for(:role)}
    #it { is_expected.to validate_presence_of(:first_name) }
  end

end

















=begin
let(:user) {build(:user)}
subject {user}

describe 'associations' do
  it { is_expected.to belong_to(:home_institution)}
  it { is_expected.to belong_to(:role)}

  it { is_expected.to have_many(:institution_roles_users) }
  it { is_expected.to have_many(:institution_roles).through(:institution_roles_users) }
  it { is_expected.to have_many(:institutions).through(:institution_roles_users) }
end

describe 'validations' do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:role) }
  it {is_expected.to validate_presence_of(:is_active)}
end
=end