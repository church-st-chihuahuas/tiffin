class UsersController < ApplicationController

  def new

  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to root_path
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
    params.require(:user).permit(:id, :email, :password, :first_name,
                                 :last_name, :street_address, :city,
                                 :state, :zip_code, :contact_phone,
                                 :password).merge(role: :client)
  end

end