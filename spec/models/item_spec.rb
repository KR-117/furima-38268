require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
    sleep 0.1
  end

  describe '商品の出品登録' do

    context '出品登録できる場合' do
      it "入力事項全てが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "category_idが「---」以外であれば登録できる" do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it "status_idが「---」以外であれば登録できる" do
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it "shipping_fee_idが「---」以外であれば登録できる" do
        @item.shipping_fee_id = 2
        expect(@item).to be_valid
      end
      it "prefecture_idが「---」以外であれば登録できる" do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end
      it "shipment_date_idが「---」以外であれば登録できる" do
        @item.shipment_date_id = 2
        expect(@item).to be_valid
      end
      it "priceが半角数字かつ300円~9,999,999円であれば登録できる" do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
    
    context '出品登録できない場合' do
      it "ユーザー登録していなければ出品できない" do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end
      it "画像が1枚なければ出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空では出品できない" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "category_idが空では出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが「---」では出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "status_idが空では出品できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "status_idが「---」では出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "shipping_fee_idが空では出品できない" do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it "shipping_fee_idが「---」では出品できない" do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end
      it "prefecture_idが空では出品できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが「---」では出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "shipment_date_idが空では出品できない" do
        @item.shipment_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment date can't be blank")
      end
      it "shipment_date_idが「---」では出品できない" do
        @item.shipment_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment date must be other than 1")
      end
      it "priceが空では出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299円以下では出品できない" do
        @item.price = 117
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10,000,000円以上では出品できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
