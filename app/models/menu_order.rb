class MenuOrder < ApplicationRecord
  belongs_to :menu
  has_many :ingredient_to_ignores
  has_many :excluded_ingredients, through: :ingredients_to_ignore, class_name: 'ingredient',
                                  foreign_key: 'ingredient_id'
end
