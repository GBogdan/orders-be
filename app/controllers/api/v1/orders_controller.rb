class Api::V1::OrdersController < ApplicationController

  def index
    orders = Order.all

    orders = orders.by_status(params[:status]) if params[:status].present?
  
    render json: orders, each_serializer: OrderSerializer
  end

  def show
    order = Order.find(params[:id])

    render json: order, serializer: OrderSerializer
  end

  def create
    order = Order.new(description: params[:data][:attributes][:description])

    order.save!

    render json: order, serializer: OrderSerializer
  end

  def update
    order = Order.find(params[:id])

    order.update!(profile_params)

    render json: order, serializer: OrderSerializer
  end

  def profile_params
    {
      status: params[:data][:attributes][:status],
      description: params[:data][:attributes][:description]
    }
  end

end
