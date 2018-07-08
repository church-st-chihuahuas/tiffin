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

  end
end