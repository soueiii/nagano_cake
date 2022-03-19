class Public::HomesController < ApplicationController

  def top
    @genres = Genre.all
    # idの降順でitemを表示させる
    @items = Item.limit(4).order(id: "DESC")
  end

end
