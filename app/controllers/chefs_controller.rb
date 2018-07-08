class ChefsController < ApplicationController
  def new
    @user = User.find_by(id: params[:user_id])
    @chef = Chef.new(user: @user)
  end

  def create
    user = User.find_by(id: params[:user_id])
    @chef = Chef.new(chef_params) do |chef|
      chef.user = user
    end
    if @chef.save
      flash.now[:alert] = 'Successfully created chef account.'
      log_in(@user)
      redirect_to chef_home_path
    else
      flash.now[:alert] = 'Unable to create chef account.'
      render :new
    end
  end

  def show
    @chef = User.find_by(id: params[:user_id]).chef
    raise ActiveRecord::RecordNotFound unless @chef
  end

  def edit
  end

  def update
  end

  def delete
  end

  def chef_params
    params.require(:chef)
        .permit(:business_name, :business_description)
  end
end
