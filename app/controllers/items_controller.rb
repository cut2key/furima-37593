class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :quality_id, :ship_fee_id,:country_id,:ship_day_id, :price, :user, :image).merge(user_id: current_user.id)
  end
end
