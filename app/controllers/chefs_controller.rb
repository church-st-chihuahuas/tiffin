class ChefsController < ApplicationController
  def new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    @chef = Chef.new(chef_params)
    @chef.save
    redirect_to chef_home_path
  end

  def edit
  end

  def update
  end

  def delete
  end

  def chef_params
    params.require(:chef).permit(:id, :user_id, :business_name, :business_description)
  end
end
