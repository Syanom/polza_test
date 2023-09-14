class MenuOrder < ApplicationRecord
  belongs_to :menu
  has_many :ingredient_to_ignores
  has_many :excluded_ingredients, through: :ingredient_to_ignores, source: :ingredient
end
