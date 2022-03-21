class Public::OrdersController < ApplicationController

  def new
   @order = Order.new
  end

  def create
   @order = Order.new
   @order.customer_id = current_customer.id
   @order.save
  end

end
