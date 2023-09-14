class CreateIngredientInDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredient_in_dishes do |t|
      t.references :ingredient
      t.references :dish

      t.timestamps
    end
  end
end
