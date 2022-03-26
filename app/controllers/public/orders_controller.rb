class Public::OrdersController < ApplicationController

  def new
   @order = Order.new
  end

  def create
   @order = Order.new(order_params)
   @order.customer_id = current_customer.id
   @order.save
   redirect_to public_verification_path(@order)
  end

  def verification
   binding.pry
  end

  private
   def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
   end

end
