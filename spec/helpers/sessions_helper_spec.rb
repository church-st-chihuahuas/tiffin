require 'rails_helper'

describe SessionsHelper do

  describe "#log_in" do
    let(:user) {create(:user)}

    before {log_in(user)}

    it 'should store user id in session' do
      expect(session[:user_id]).to eq(user.id)
    end

    it 'should store last login time in session' do
      expect(session[:last_login_time]).to be_present
    end

    it 'should store last login time in session' do
      expect(session[:last_request_time]).to be_present
    end

  end

  describe "#log_out" do
    let(:user) {create(:user)}

    before {log_in(user)}

    it 'should store user id in session' do
      expect(session[:user_id]).to eq(user.id)
    end

  end

end