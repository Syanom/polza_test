class CreateDishInMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :dish_in_menus do |t|
      t.references :dish
      t.references :menu

      t.timestamps
    end
  end
end
