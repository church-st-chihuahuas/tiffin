class MealsController < ApplicationController

  before_action :find_chef, only: %i[index new create]

  def index
    @meals = @chef.meals
  end

  def new
    @meal = Meal.new(chef: @chef)
  end

  def create
    @meal = Meal.new(meal_params) { |meal| meal.chef = @chef }
    if @meal.save
      redirect_to chef_meals_path(@chef), notice: 'Meal created successfully'
    else
      #validation errors
      render 'new'
    end
  end

  def show
    @meal = Meal.find_by(id: params[:id])
    raise ActiveRecord::RecordNotFound unless @meal
  end

  def edit
    @meal = Meal.find_by(id: params[:id])
    raise ActiveRecord::RecordNotFound unless @meal
  end

  def update
    @meal = Meal.find_by(id: params[:id])
    @chef = @meal.chef
    raise ActiveRecord::RecordNotFound unless @meal
    if @meal.update(meal_params)
      redirect_to chef_meals_path(@chef), notice: 'Meal updated successfully'
    else
      #validation errors
      render 'new'
    end
  end

  def destroy
    @meal = Meal.find_by(id: params[:id])
    raise ActiveRecord::RecordNotFound unless @meal
    chef = @meal.chef
    if @meal.destroy
      redirect_to chef_meals_path(chef)
    else
      render 'index'
    end
  end

  def meal_params
    params.require(:meal)
        .permit(:short_name, :description, cuisine_ids: [],
                dietary_accommodation_ids: [])
  end

  private

  def find_chef
    @chef = Chef.find_by(id: params[:chef_id])
  end

end
