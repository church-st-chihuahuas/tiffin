require 'rails_helper'

describe 'Chef Meals routes' do
  let(:meal) {create(:meal)}
  let(:chef) {meal.chef}

  it {expect(get(chef_meals_path(chef))).to route_to(controller: 'meals', action: 'index', chef_id: chef.id.to_s)}
  it {expect(post(chef_meals_path(chef))).to route_to(controller: 'meals', action: 'create', chef_id: chef.id.to_s)}
  it {expect(get(new_chef_meal_path(chef))).to route_to(controller: 'meals', action: 'new', chef_id:  chef.id.to_s)}
  it {expect(get(edit_meal_path(meal))).to route_to(controller: 'meals', action: 'edit', id: meal.id.to_s)}
  it {expect(put(meal_path(meal))).to route_to(controller: 'meals', action: 'update', id: meal.id.to_s)}
  it {expect(delete(meal_path(meal))).to route_to(controller: 'meals', action: 'destroy',id: meal.id.to_s)}
end