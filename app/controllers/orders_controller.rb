class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if@order_address.valid?
      @order_address.save
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, 
                :city, :house_number, :building, :telephone).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
