class KitchenController < ApplicationController
  def orders_to_cook
    render json: KitchenOrderCreator.new.create
  end
end
