class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if @user.client?
        redirect_to client_home_path
      else
        redirect_to new_user_chef_path(@user.id)
      end
    else
      render 'new'
    end
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
                                 :password, :role)
  end

end