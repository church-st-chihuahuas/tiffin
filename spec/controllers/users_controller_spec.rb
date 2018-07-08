require 'spec_helper'

describe UsersController do
  include SessionsHelper

  describe 'GET new' do
    context 'when user is logged out' do
      it 'renders the index template' do
        get :new
        expect(response).to render_template('new')
      end
    end

    context 'when user is logged in' do
      let(:client) {create(:user)}
      it 'redirects to user home' do
        log_in(client)

        get :new
        expect(response).to redirect_to(user_home_path)
      end
    end

  end

  describe 'POST create' do
    let(:client) {build(:user, street_address: '1001 Massachusetts Ave.',
                         city: 'Cambridge', state: 'MA', zip_code: '02138',
                         first_name: 'John', last_name: 'Smith', email: 'john@example.com',
                         password: 'security', password_confirmation: 'security')}
    it 'geocodes the user location' do
      post :create, {params: {user: client.attributes}}
      my_client = User.find_by_email(client.email)
      expect(my_client.latitude).to be_within(0.01).of(42.3693)
      expect(my_client.longitude).to be_within(0.01).of(-71.1112)

    end
  end
end