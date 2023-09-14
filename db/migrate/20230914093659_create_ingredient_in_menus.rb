class CreateIngredientInMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredient_in_menus do |t|

      t.timestamps
    end
  end
end
