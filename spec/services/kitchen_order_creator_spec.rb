require 'rails_helper'

RSpec.describe KitchenOrderCreator do
  it 'marks menu orders as delivered to kitchen' do
    KitchenOrderCreator.new.create
    expect(MenuOrder.where(delivered_to_kitchen: false).present?).to be(false)
  end

  it 'returns array of hashes [ {name: name_of_dish, count: number_to_cook}, ... ]' do
    service_responce = KitchenOrderCreator.new.create
    expect(service_responce.count).to be > 0
    expect(service_responce.sample.class).to be(Hash)
    expect(service_responce.sample.count).to be(2)
    expect(service_responce.sample.keys).to eq(%i[name count])
    expect(service_responce.sample.values.first.class).to be(String)
    expect(service_responce.sample.values.last.class).to be(Integer)
  end

  it 'counts dishes to cook accurate' do
    service_responce = KitchenOrderCreator.new.create
    expect(service_responce.first[:name]).to eq('Овсянка')
    expect(service_responce.first[:count]).to be(2)

    expect(service_responce[1][:name]).to eq('Сырники со сметаной')
    expect(service_responce[1][:count]).to be(1)

    expect(service_responce.last[:name]).to eq('Курица в сметане с пюре')
    expect(service_responce.last[:count]).to be(1)
  end
end
