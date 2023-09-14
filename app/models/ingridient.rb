class Ingridient < ApplicationRecord
  has_many :ingridient_in_menus
  has_many :menus, through: :ingredient_in_menus
end
