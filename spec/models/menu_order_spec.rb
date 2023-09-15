require 'rails_helper'

RSpec.describe MenuOrder, type: :model do
  it 'can produce dishes' do
    order = MenuOrder.find(2)
    expect(order.dishes.count).to be(3)
    expect(order.dishes.sample.class).to be(Dish)
  end

  it 'exclude dishes with ingredient to ignore' do
    order = MenuOrder.find(1)
    expect(order.dishes.count).to be(1)
    expect(order.dishes.first).to eq(Dish.find(1))
  end
end
