class Menu < ApplicationRecord
  has_many :dish_in_menus
  has_many :dishes, through: :dish_in_menus
  has_many :ingridient_in_menus
  has_many :ingridients, through: :ingridient_in_menus
  has_many :menu_orders
end
