class ChefsController < ApplicationController

  before_action :require_login, except: [:new, :create]

  def index
    keys = params[:report_form][:q].split() if params[:report_form]
    unless keys
      @chefs = []
      return
    end

    like_array = keys.map do |key|
       "description LIKE '%#{key}%'"
    end
    like_string = like_array.join(" OR ")


    @chefs = Chef.joins(:cuisine).includes(:cuisine)
                 .joins(:dietary_accommodation).includes(:dietary_accommodation)
                 .joins(:meal).includes(:meal)
                 .where(cuisines: {name: keys})
                 .or(Chef.joins(:cuisine).includes(:cuisine)
                         .joins(:dietary_accommodation).includes(:dietary_accommodation)
                         .joins(:meal).includes(:meal)
                         .where(dietary_accommodations: {name: keys}))
                 .or(Chef.joins(:cuisine).includes(:cuisine)
                         .joins(:dietary_accommodation).includes(:dietary_accommodation)
                         .joins(:meal).includes(:meal)
                         .where(like_string))

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
