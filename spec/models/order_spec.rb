require 'rails_helper'

RSpec.describe Order, type: :model do

  let(:order) { FactoryBot.create(:order, description: 'description') }

  it 'should create a order with a description and a status' do
    expect(order.description).to eq('description')
    expect(order.status).to eq('open')
  end

  it 'is not valid without description' do
    order = Order.new()
    order.save
    expect(order.errors.messages[:description]).to eq(["can't be blank"])
  end

  it 'should not update status from open to delivered' do
    order.update(status: 'delivered')

    expect(order.errors.messages[:status]).to eq(['invalid'])
  end

  it 'should not update status from pending to open' do
    order.update(status: 'pending')

    order.update(status: 'open')

    expect(order.errors.messages[:status]).to eq(['invalid'])
  end

end
