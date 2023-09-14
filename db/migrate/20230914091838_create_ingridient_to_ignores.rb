class CreateIngridientToIgnores < ActiveRecord::Migration[7.0]
  def change
    create_table :ingridient_to_ignores do |t|
      t.references :menu_order
      t.references :ingridient

      t.timestamps
    end
  end
end
