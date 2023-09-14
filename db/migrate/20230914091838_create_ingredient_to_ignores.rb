class CreateIngredientToIgnores < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredient_to_ignores do |t|
      t.references :menu_order
      t.references :ingredient

      t.timestamps
    end
  end
end
