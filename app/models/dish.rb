class Dish < ApplicationRecord
  has_many :menus, through: :dish_in_menus
end
