class Dish < ApplicationRecord
  has_many :dish_in_menus
  has_many :menus, through: :dish_in_menus
end
