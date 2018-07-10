require 'rails_helper'

describe MealsController do
  include SessionsHelper

  let(:client) {create :user}

  before do
    log_in(client)
  end

  describe "GET index" do
    it 'renders the index template' do
      pending("this is failing")
      get :index
      expect(response).to render_template('index')
    end
  end
end