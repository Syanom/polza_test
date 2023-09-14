class CreateIngridients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingridients do |t|
      t.string :name

      t.timestamps
    end
  end
end
