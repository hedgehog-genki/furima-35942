require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の投稿' do
    context '商品の投稿ができる場合' do
      it '正しい情報を入力すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の投稿ができない場合' do
      it '画像がないと投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '説明がないと投稿できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーが選択されてないと投稿できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'category_idが1だと投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態が選択されてないと投稿できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end
      it 'status_idが1だと投稿できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '配送日が選択されてないと投稿できない' do
        @item.schedule_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Schedule delivery is not a number')
      end
      it 'schedule_delivery_idが1だと登録できない' do
        @item.schedule_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Schedule delivery must be other than 1')
      end
      it '配送料の負担が選択されてないと投稿できない' do
        @item.fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee status is not a number')
      end
      it 'fee_statsu_idが1だと登録できない' do
        @item.fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee status must be other than 1')
      end
      it '発送の地域が選択されてないと投稿できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '販売価格が空だと投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が全角だと投稿できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格が299円だと投稿できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it '販売価格が1000万円だと投稿できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'priceが英数混合だと登録できない' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは英文字だけでは登録できない' do
        @item.price = 'aaaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'ユーザーが紐付いていないと投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
