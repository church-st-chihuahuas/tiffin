class MealsController < ApplicationController

  def index
    keys = params[:report_form][:q] if params[:report_form]
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
                         .where(short_name: keys))
  end

end