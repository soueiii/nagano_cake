class Public::CartItemsController < ApplicationController

 def index
  @cart_items = current_customer.cart_items.all
 end

 def create
  @item = CartItem.new(cart_item_params)
  @item.customer_id = current_customer.id
  if CartItem.find_by(item: "いちごのケーキ")
   @item.item.amount "+1".to_i
  else
   @item.save
   redirect_to public_cart_items_path
  end
 end

 def destroy
  @cart_item = CartItem.find(params[:id])
  @cart_item.destroy
  redirect_to public_cart_items_path
 end

 def destroy_all
  @cart_item = CartItem.all
  current_customer.cart_items.destroy_all
  redirect_to public_cart_items_path
 end
private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
end

end
