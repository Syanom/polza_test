class MenuParser
  def initialize(path)
    @menu_file = YAML.load_file(path)
  end

  def parse
    # хорошо бы было иметь что-то, чтобы идентифицировать меню и не плодить одинаковых этим сервисом
    menu = Menu.create
    create_ingredients(@menu_file['ingredients'], menu)

    @menu_file['dishes'].each do |dish_hash|
      dish = Dish.find_by(name: dish_hash['name'])
      dish ||= Dish.create(name: dish_hash['name'])
      next unless dish

      DishInMenu.create(dish:, menu:) unless DishInMenu.find_by(dish:, menu:)

      create_ingredients(dish_hash['ingredients'], menu, dish)
    end
  end

  private

  def create_ingredients(ingredients, menu, dish = nil)
    ingredients.each do |ingredient_name|
      ingredient = Ingredient.find_by(name: ingredient_name)
      ingredient ||= Ingredient.create(name: ingredient_name)
      next unless ingredient

      IngredientInMenu.create(ingredient:, menu:) unless IngredientInMenu.find_by(ingredient:, menu:)
      IngredientInDish.create(ingredient:, dish:) if dish && !IngredientInDish.find_by(ingredient:, dish:)
    end
  end
end
