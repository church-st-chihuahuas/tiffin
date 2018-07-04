class UsersController < ApplicationController

  def new

  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit

  end

  def update

  end

  def delete

  end

  def user_params
    params.require(:user).permit(:id, :email, :password)
  end

end