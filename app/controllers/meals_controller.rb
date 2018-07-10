class MealsController < ApplicationController

  def index
    chef = Chef.find_by(id: params[:chef_id])
    @meals = chef.meals
  end

  def new

  end

  def create

  end

  def show
    @meal = Meal.find_by(id: params[:id])
    raise ActiveRecord::RecordNotFound unless @meal
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def meal_params
    params.require(:meal)
        .permit(:short_name, :description)
  end

end
