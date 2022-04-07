class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :purchase_auth
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
   
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_auth
    if @item_user == @purchase_address_user
      redirect_to root_path
    end
  end

  def purchase_params
    params.require(:purchase_address).permit(:zip_code, :country_id, :city, :st_address, :building, :phone_num).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
 
end
