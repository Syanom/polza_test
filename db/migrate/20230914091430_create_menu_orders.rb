class CreateMenuOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_orders do |t|
      t.boolean :delivered_to_kitchen, default: false
      t.references :menu

      t.timestamps
    end
  end
end
