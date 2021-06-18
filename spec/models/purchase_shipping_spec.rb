require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '購入情報の作成' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase_shipping = FactoryBot.build(:purchase_shipping, item_id: item.id, user_id: user.id) 
      sleep(0.5)
    end
    context '正常に購入処理が出来る' do
      it '全て記入してあれば保存できること' do
        expect(@purchase_shipping).to be_valid
      end
      it '建物名がなくても購入できる' do
        @purchase_shipping.building = ""
        expect(@purchase_shipping).to be_valid
      end
    end

    context '購入処理ができない' do
      it '郵便番号情報がないと購入できない' do 
        @purchase_shipping.postal_coad = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal coad can't be blank", "Postal coad is invalid. Include hyphen(-)")
      end
      it '郵便番号はハイフンが無いと購入できない' do
        @purchase_shipping.postal_coad = "1234567"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal coad is invalid. Include hyphen(-)")
      end
      it '都道府県情報がないと購入できない' do
        @purchase_shipping.prefecture_id = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと購入できない' do
        @purchase_shipping.prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が空欄だと購入できない' do
        @purchase_shipping.city = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空欄だと購入できない' do
        @purchase_shipping.address = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空欄だと購入できない' do
        @purchase_shipping.phone_number = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank", "Phone number PhoneNumber must be 10or11 digit Half-width numbers")
      end
      it '電話番号が12桁だと購入できない' do
        @purchase_shipping.phone_number = "090123456789"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number PhoneNumber must be 10or11 digit Half-width numbers")
      end
      it '電話番号が9桁だと購入できない' do
        @purchase_shipping.phone_number = "090123456"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number PhoneNumber must be 10or11 digit Half-width numbers")
      end
      it '電話番号が全角だと購入できない' do
        @purchase_shipping.phone_number = "０９０１２３４５６７８"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number PhoneNumber must be 10or11 digit Half-width numbers")
      end
      it 'tokenが空だと購入できない' do
        @purchase_shipping.token = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できない' do
        @purchase_shipping.user_id = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @purchase_shipping.item_id = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
