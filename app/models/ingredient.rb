class Ingredient < ApplicationRecord
  has_many :ingredient_in_menus
  has_many :menus, through: :ingredient_in_menus
end
