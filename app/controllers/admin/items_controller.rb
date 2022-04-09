class Admin::ItemsController < ApplicationController

 def index
  @genres = Genre.all
  @items = Item.all
 end

 def new
   @item = Item.new
   @genres = Genre.all
 end

 def create
   @genres = Genre.all
   @item = Item.new(item_params)
   @item.save
   redirect_to admin_item_path(@item)
 end

 def show
  @cart_item = CartItem.new
  @item = Item.find(params[:id])
 end

 def edit
  @genres = Genre.all
  @item = Item.find(params[:id])
 end

 def update
  @item = Item.find(params[:id])
  @item.update!(item_params)
  redirect_to admin_item_path(@item)
 end

 def item_params
   params.require(:item).permit(:name,:image,:introduction,:price, :genre)
 end
end
