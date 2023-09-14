class OrderCreator
  def initialize(menu, ingredient_ids)
    @menu = menu
    @ingredients_to_ignore = Ingredient.where(id: ingredient_ids)
  end

  def create_order
    menu_order = MenuOrder.create(menu: @menu)
    return menu_order unless @ingredients_to_ignore

    @ingredients_to_ignore.each do |ingredient|
      IngredientToIgnore.create!(ingredient:, menu_order:)
    end

    menu_order.save
  end
end
