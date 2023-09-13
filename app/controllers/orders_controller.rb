class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    if current_user.id == @item.user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item       
      @order_address.save
     return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  
  def order_params
    params.require(:order_address).permit(:item_id, :image, :post_code, :city, :address, :building_name, :phone_num, :prefecture_id).merge(user_id: current_user.id, token: params[:token], item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
end
