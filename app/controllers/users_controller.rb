class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]
  before_action :check_signed_in, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:alert] = 'Successfully created client account.'
      if @user.client?
        redirect_to login_path
      else
        redirect_to login_path(@user.id)
      end
    else
      flash[:alert] = 'Unable to create user account.'
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    unless @user
      flash.now[:alert] = 'User not found.'
    end
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
                                 :password, :password_confirmation, :role)
  end

end