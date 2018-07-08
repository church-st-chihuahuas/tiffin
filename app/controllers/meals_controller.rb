class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

end