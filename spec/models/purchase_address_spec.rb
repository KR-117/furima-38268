require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '配送先情報の保存' do

    context '配送先の情報が保存できる場合' do
      it "入力事項全てが存在すれば保存できる" do
        expect(@purchase_address).to be_valid
      end
      it "user_idが空でなければ保存できる" do
        @purchase_address.user_id = 1
        expect(@purchase_address).to be_valid
      end
      it "item_idが空でなければ保存できる" do
        @purchase_address.item_id = 1
        expect(@purchase_address).to be_valid
      end
      it "postal_codeが3「桁ハイフン4桁」の半角文字列であれば保存できる" do
        @purchase_address.postal_code = "123-4567"
        expect(@purchase_address).to be_valid
      end
      it "prefecture_idが「---」以外であれば保存できる" do
        @purchase_address.prefecture_id = 2
        expect(@purchase_address).to be_valid
      end
      it "cityが空でなければ保存できる" do
        @purchase_address.city = "新宿区"
        expect(@purchase_address).to be_valid
      end
      it "house_numberが空でなければ保存できる" do
        @purchase_address.house_number = "新宿3-3-3"
        expect(@purchase_address).to be_valid
      end
      it "building_nameが空でも保存できる" do
        @purchase_address.building_name = nil
        expect(@purchase_address).to be_valid
      end
      it "phone_numberが空でなければ保存できる" do
        @purchase_address.phone_number = 12345678910
        expect(@purchase_address).to be_valid
      end
      it "phone_numberが10桁以上11桁以内の半角数値のみ保存できる" do
        @purchase_address.phone_number = 10987654321
        expect(@purchase_address).to be_valid
      end
    end

    context '配送先の情報が保存できない場合' do
      it "user_idが空では保存できない" do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では保存できない" do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it "postal_codeが空では保存できない" do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが「3桁ハイフン4桁」の半角文字列のみでなければ保存できない" do
        @purchase_address.postal_code = 1234567
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが空では保存できない" do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが「---」では保存できない" do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では保存できない" do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空では保存できない" do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空では保存できない" do
        @purchase_address.phone_number =nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが9桁以下では保存できない" do
        @purchase_address.phone_number = 12345678
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが12桁以上では保存できない" do
        @purchase_address.phone_number = 123456789123
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberにハイフンが含まれると保存できない" do
        @purchase_address.phone_number = 123-4567-8910
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では保存できない" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end