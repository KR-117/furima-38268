class ItemsController < ApplicationController

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :shipment_date_id, :price).merge(user_id: current_user.id)
  end
end
