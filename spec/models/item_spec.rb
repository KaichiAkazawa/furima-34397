require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/sample1.png')
  end

  describe '新規商品出品' do
    it '画像ファイルが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーを選択しなければ登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it '商品の状態を選択しなければ登録できない' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('State Select')
    end
    it '配送料の負担を選択しなければ登録できない' do
      @item.shipping_cost_payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping cost payer Select')
    end
    it '発送元の地域を選択しなければ登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end
    it '発送までの日数を選択しなければ登録できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping day Select')
    end
    it '価格が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が¥300を下回ると登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it '価格が¥9999999を上回ると登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it '価格が数字でないと登録できない' do
      @item.price = 'test'
      @item.valid?
      @item.valid? expect(@item.errors.full_messages).to include('Price Half-width number')
    end
    it '価格が半角でないと登録できない' do
      @item.price = '１０００'
      @item.valid?
      @item.valid? expect(@item.errors.full_messages).to include('Price Half-width number')
    end
  end
end
