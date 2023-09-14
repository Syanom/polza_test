class Menu < ApplicationRecord
  has_many :dishes, through: :dish_in_menus
end
