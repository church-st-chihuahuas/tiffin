class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.chef?
        redirect_to chef_home_path
      else
        redirect_to user_home_path, notice: 'Success!'
      end
    else
      # Create an error message.
      render 'new', alert: 'failed'
    end
  end

  def destroy
  end
end
