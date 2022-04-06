class PurchasesController < ApplicationController
  #before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    #Address.create(address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  #def purchase_auth
    #if current_user == @item.user
      #redirect_to root_path

  def purchase_params
    #params.permit(:item_name, :image, :price, :ship_fee_id).merge(user_id: current_user.id, item_id: @item_id)
    params.require(:purchase_address).permit(:zip_code, :country_id, :city, :st_address, :building, :phone_num).merge(user_id: current_user.id, item_id: @item.id)
  end

  #def address_params
    #params.permit(:zip_code, :country_id, :city, :st_address, :building,:phone_num).merge(purchase_id: @purchase.id)
  #end
end
