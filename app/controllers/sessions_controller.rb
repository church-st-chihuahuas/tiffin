class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      if user.chef?
        redirect_to chef_home_path
      else
        redirect_to user_home_path
      end
    else
      # render 'new', alert: 'Unable to login: email or password are incorrect.'
      flash[:alert] = 'Unable to login: email or password are incorrect'
      render 'new'
    end
  end

  def destroy
    reset_session
    flash[:notice] = 'You have successfully logged out.'
    redirect_to root_path
  end
end
