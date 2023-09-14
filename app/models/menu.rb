class Menu < ApplicationRecord
  has_many :dish_in_menus
  has_many :dishes, through: :dish_in_menus
  has_many :ingredient_in_menus
  has_many :ingredients, through: :ingredient_in_menus
  has_many :menu_orders
end
