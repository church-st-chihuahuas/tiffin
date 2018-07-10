class MealsController < ApplicationController

  before_action :find_chef, only: %i[index new create]

  def index
    @meals = @chef.meals
  end

  def new
    @meal = Meal.new(chef: @chef)
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

  private

  def find_chef
    @chef = Chef.find_by(id: params[:chef_id])
  end

end
