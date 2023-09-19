class MenuOrder < ApplicationRecord
  belongs_to :menu
  has_many :ingredient_to_ignores
  has_many :excluded_ingredients, through: :ingredient_to_ignores, source: :ingredient

  def dishes
    excluded_ingredient_ids = excluded_ingredients.map(&:id)
    Dish.includes(:ingredients).where.not(ingredients: { id: excluded_ingredient_ids })
  end
end
