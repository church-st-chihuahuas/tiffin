class ChefsController < ApplicationController

  before_action :require_login, except: %i[new create]

  def index
    keys = params[:report_form][:q].split() if params[:report_form]
    @chefs = []
    return unless keys

    meals_like_array = keys.map do |key|
      "meals.description LIKE '%#{key}%'"
    end
    meals_like_string = meals_like_array.join(' OR ')

    biz_desc_like_array = keys.map do |key|
      "business_description LIKE '%#{key}%'"
    end
    biz_desc_like_str = biz_desc_like_array.join(' OR ')

    biz_name_like_array = keys.map do |key|
      "business_name LIKE '%#{key}%'"
    end
    biz_name_like_str = biz_name_like_array.join(' OR ')

    @chefs = Chef.for_clients.where(cuisines: { name: keys })
                 .or(Chef.for_clients.where(dietary_accommodations: { name: keys }))
                 .or(Chef.for_clients.where(meals_like_string))
                 .or(Chef.for_clients.where(certifications: { name: keys }))
                .or(Chef.for_clients.where(biz_name_like_str))
                .or(Chef.for_clients.where(biz_desc_like_str)).distinct

    if params[:radius] != 'N/A'
      @chefs = @chefs.select do |chef|
        chef.user.distance_to(@current_user) <= params[:radius].to_f
      end
    end
  end

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
      log_in(user)
      redirect_to user_chefs_path(user)
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
    @chef = User.find_by(id: params[:user_id]).chef
    raise ActiveRecord::RecordNotFound unless @chef
  end

  def update
    @chef = User.find_by(id: params[:user_id]).chef
    raise ActiveRecord::RecordNotFound unless @chef
    if @chef.update(chef_params)
      redirect_to chef_meals_path(@chef), notice: 'Chef updated successfully'
    else
      #validation errors
      render 'edit'
    end
  end

  def delete
  end

  def chef_params
    params.require(:chef)
        .permit(:business_name, :business_description, cuisine_ids: [],
                dietary_accommodation_ids: [], certification_ids: [])
  end
end
