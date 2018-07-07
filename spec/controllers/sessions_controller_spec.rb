require 'rails_helper'

describe SessionsController do
  include SessionsHelper

  describe "POST create" do
    let(:client) {create(:user)}
    it "renders the index template" do
      post :create, {params: {session: {email: client.email, password: client.password}}}
      expect(response).to redirect_to(user_home_path)
    end
  end

  describe "GET new" do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "DELETE destroy" do
    it 'logs out user' do
      delete :destroy
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'DELETE #destroy' do
    context 'success' do
      let(:client) {create(:user)}
      before do
        log_in(client)
        delete :destroy
      end
      it 'deletes the user\'s session' do
        expect(session[:user_id]).to be_nil
      end

    end

  end
end