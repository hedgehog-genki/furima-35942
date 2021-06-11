class ItemController < ApplicationController
  def new
    @item = Item.new
  end
end
