class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

end
