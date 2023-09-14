class Dish < ApplicationRecord
  has_many :dish_in_menus
  has_many :menus, through: :dish_in_menus
  has_many :ingredient_in_dishes
  has_many :ingredients, through: :ingredient_in_dishes
end
