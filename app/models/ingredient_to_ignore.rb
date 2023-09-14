class IngredientToIgnore < ApplicationRecord
  belongs_to :menu_order
  belongs_to :ingredient
end
