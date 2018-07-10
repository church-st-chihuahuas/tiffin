class MealsController < ApplicationController

  def index
    keys = params[:report_form][:q].split() if params[:report_form]
    @meals = Meal.joins(:cuisine).includes(:cuisine)
                 .joins(:dietary_accommodation).includes(:dietary_accommodation)
                 .joins(:chef).includes(:chef)
                 .where(cuisines: {name: keys})
                 .or(Meal.joins(:cuisine).includes(:cuisine)
                         .joins(:dietary_accommodation).includes(:dietary_accommodation)
                         .joins(:chef).includes(:chef)
                         .where(dietary_accommodations: {name: keys}))
                 .or(Meal.joins(:cuisine).includes(:cuisine)
                         .joins(:dietary_accommodation).includes(:dietary_accommodation)
                         .joins(:chef).includes(:chef)
                         .where("short_name = ? OR description = ?", keys, keys))
  end

  def new

  end

  def create

  end

  def show
    @meal = Meal.find_by(id: params[:meal_id])
    raise ActiveRecord::RecordNotFound unless @meal
  end

  def edit

  end

  def update

  end

  def delete

  end

  def meal_params
    params.require(:meal)
        .permit(:short_name, :description)
  end

end
