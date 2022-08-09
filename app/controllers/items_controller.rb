class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :find_item, only: [:show, :edit, :update, :destroy]

  before_action :redirect, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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
    if @item.valid?
      redirect_to item_path(item_params)
    else
      render "edit"
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :shipment_date_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def redirect
    unless current_user.id == @item.user.id && @item.purchase.nil?
      redirect_to root_path
    end
  end
end
