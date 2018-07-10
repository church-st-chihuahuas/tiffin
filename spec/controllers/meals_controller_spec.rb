require 'rails_helper'

describe MealsController do
  include SessionsHelper

  let(:chef) {create :chef}

  before do
    log_in(chef.user)
  end

  describe "GET index" do
    it 'renders the index template' do
      get :index, params: {chef_id: chef.id}
      expect(response).to render_template('index')
    end
  end
end