class Api::V1::OrdersController < ApplicationController

  def index
    orders = Order.all

    render json: orders, each_serializer: OrderSerializer
  end

  def show
    order = Order.find(params[:id])

    render json: order, serializer: OrderSerializer
  end

  def create
    order = Order.new(product_ids: params[:data][:attributes][:product_ids])

    order.save or raise_api_error(order.error)

    render json: order, serializer: OrderSerializer
  end

  def update
    order = Order.find(params[:id])

    order.update(profile_params) or raise_api_error(order.error)

    render json: order, serializer: OrderSerializer
  end

  def profile_params
    {
      status: params[:data][:attributes][:status],
      product_ids: params[:data][:attributes][:product_ids]
    }
  end

  private

  def raise_api_error(error)
    render json: { error: error }, status: 404
  end

end
