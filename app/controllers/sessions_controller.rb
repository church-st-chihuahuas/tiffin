class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to root_path, notice: 'Success!'
    else
      # Create an error message.
      render 'new', alert: 'failed'
    end
  end

  def destroy
  end
end
