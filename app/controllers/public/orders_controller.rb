class Public::OrdersController < ApplicationController

  def new
   @order = Order.new
  end

  def show
   @order = Order.find(params[:id])
  end

  def index
   @order = current_customer.orders
  end

  def create
   @order = Order.new(order_params)
   @order.customer_id = current_customer.id
   @order.save
  cart_items = current_customer.cart_items
  cart_items.each do |cart_item|
   @order_detail = OrderDetail.new
   @order_detail.order_id = @order.id
   @order_detail.item_id = cart_item.item_id
   @order_detail.amount = cart_item.amount
   @order_detail.price = cart_item.item.price
   @order_detail.save
  end
  current_customer.cart_items.destroy_all
  redirect_to public_thanks_path
  end

  def verification
   @order = Order.new(order_params)
   # ご自身の住所
   if params[:order][:select_address] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
   #登録済み住所
   elsif params[:order][:select_address] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
   #新しい住所
   else params[:order][:select_address] == "2"
   end
   @cart_items = current_customer.cart_items.all
   @total = 0

  end

  private
   def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
   end

end
