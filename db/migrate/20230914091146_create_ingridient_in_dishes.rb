class CreateIngridientInDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :ingridient_in_dishes do |t|
      t.references :ingridient
      t.references :dish

      t.timestamps
    end
  end
end
