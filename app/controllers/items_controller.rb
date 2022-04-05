class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :edit_auth, only: [:edit, :update]
  before_action :item_sc, only: [:show]

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
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end 

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :quality_id, :ship_fee_id,:country_id,:ship_day_id, :price, :user, :image).merge(user_id: current_user.id)
  end

  def edit_auth
    @item = Item.find(params[:id])

    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def item_sc
    @item = Item.find(params[:id])
  end
end
