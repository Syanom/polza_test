class KitchenOrderCreator
  def initialize
    @menu_orders = MenuOrder.where(delivered_to_kitchen: false)
  end

  def create
    dishes_with_count = {}
    @menu_orders.each do |order|
      order.menu.dishes.each do |dish|
        unless dish.ingredients.where(id: order.excluded_ingredients.map(&:id)).present?
          if dishes_with_count[dish.name.to_sym].present?
            dishes_with_count[dish.name.to_sym] += 1
          else
            dishes_with_count[dish.name.to_sym] = 1
          end
        end
      end
    end

    dishes_with_count_array = dishes_with_count.map { |dish, count| { name: dish, count: } }
    dishes_with_count_array.sort_by { |dish| -dish[:count] }
  end
end
