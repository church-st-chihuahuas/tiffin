require 'rails_helper'

describe SessionsController do
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
end