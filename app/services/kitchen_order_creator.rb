class KitchenOrderCreator
  def initialize
    @menu_orders = MenuOrder.where(delivered_to_kitchen: false)
  end

  def create
    dishes_with_count = @menu_orders.map { |order| order.dishes.to_a }.flatten.tally
    @menu_orders.update_all(delivered_to_kitchen: true)
    dishes_with_count.map { |dish, count| { name: dish.name, count: } }
                     .sort_by { |dish| -dish[:count] }
  end
end
