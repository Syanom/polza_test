class KitchenController < ApplicationController
  def orders_to_cook
    orders = [{ name: 'Омлет с брокколи', count: 10 }, { name: 'Овсяный сырник с вишней', count: 9 }]
    render json: KitchenOrderCreator.new.create
  end
end
