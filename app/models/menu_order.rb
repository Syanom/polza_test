class MenuOrder < ApplicationRecord
  belongs_to :menu
  has_many :ingredient_to_ignores
  has_many :excluded_ingredients, through: :ingredient_to_ignores, source: :ingredient

  def dishes
    excluded_ingredient_ids = excluded_ingredients.map(&:id)
    dish_ids = menu.dishes.map do |dish|
      dish.id unless dish.ingredients.where(id: excluded_ingredient_ids).present?
    end
    Dish.where(id: dish_ids)
  end
end
