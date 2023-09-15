# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

menu = Menu.create

dishes = Dish.create([{ name: 'Овсянка' }, { name: 'Сырники со сметаной' }, { name: 'Курица в сметане с пюре' }])
DishInMenu.create([{ menu:, dish: dishes[0] }, { menu:, dish: dishes[1] }, { menu:, dish: dishes[2] }])

ingredients = Ingredient.create([{ name: 'Овсяные хлопья' }, { name: 'Сметана' }, { name: 'Курица' }])
IngredientInMenu.create([{ menu:, ingredient: ingredients[0] }, { menu:, ingredient: ingredients[1] },
                         { menu:, ingredient: ingredients[2] }])
IngredientInDish.create([
                          { dish: dishes[0], ingredient: ingredients[0] },
                          { dish: dishes[1], ingredient: ingredients[1] },
                          { dish: dishes[2], ingredient: ingredients[1] },
                          { dish: dishes[2], ingredient: ingredients[2] }
                        ])

menu_orders = MenuOrder.create([{ delivered_to_kitchen: false, menu: }, { delivered_to_kitchen: false, menu: }])
IngredientToIgnore.create([{ menu_order: menu_orders[0], ingredient: ingredients[1] },
                           { menu_order: menu_orders[0], ingredient: ingredients[2] }])
