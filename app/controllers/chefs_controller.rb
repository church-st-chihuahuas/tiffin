class ChefsController < ApplicationController

  before_action :require_login, except: %i[new create]

  def index
    keys = params[:report_form][:q].split() if params[:report_form]
    @chefs = []
    return unless keys

    like_array = keys.map do |key|
      "meals.description LIKE '%#{key}%'"
    end
    like_string = like_array.join(' OR ')

    @chefs = Chef.for_clients.where(cuisines: { name: keys })
                 .or(Chef.for_clients.where(dietary_accommodations: { name: keys }))
                 .or(Chef.for_clients.where(like_string))
                 .or(Chef.for_clients.where(certifications: { name: keys }))

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
  end

  def update
  end

  def delete
  end

  def chef_params
    params.require(:chef)
        .permit(:business_name, :business_description, cuisine_ids: [],
                dietary_accommodation_ids: [], certification_ids: [])
  end
end
