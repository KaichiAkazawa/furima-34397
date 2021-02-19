require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_order = FactoryBot.build(:purchase_order, user_id: user.id, item_id: item.id)
    sleep(0.1) #MySQLエラー回避のためインスタンス生成後0.1秒待機してからテスト実行
  end

  describe '商品が購入できる' do
    it '正しい情報を入力すれば購入できる' do
      expect(@purchase_order).to be_valid
    end
  end

  describe '商品購入が購入できない' do
    it '郵便番号が空では購入できない' do
      @purchase_order.postal_code = ''
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にハイフンがないと購入できない' do
      @purchase_order.postal_code = '1234567'
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include('Postal code Input correctly')
    end

    it '郵便番号のハイフンの前が数字3桁でないと購入できない' do
      @purchase_order.postal_code = '12-3456'
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include('Postal code Input correctly')
    end

    it '郵便番号のハイフンの後が数字4桁でないと購入できない' do
      @purchase_order.postal_code = '123-456'
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include('Postal code Input correctly')
    end

    it '郵便番号が数字でないと登録できない' do
      @purchase_order.postal_code = 'aaa-aaaa'
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include('Postal code Input correctly')
    end

    it '都道府県を選択しないと登録できない' do
      @purchase_order.prefecture_id = 1
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include('Prefecture Select')
    end

    it '番地が空では購入できない' do
      @purchase_order.address_number = ''
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Address number can't be blank")
    end

    it '電話番号が空では登録できない' do
      @purchase_order.phone_number = ''
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が数字でないと登録できない' do
      @purchase_order.phone_number = 'abcdefghijk'
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include('Phone number Input only number')
    end

    it '電話番号が12桁以上だと購入できない' do
      @purchase_order.phone_number = '012345678910'
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include('Phone number Input only number')
    end

    it 'トークンが空では購入できない' do
      @purchase_order.token = ''
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空では登録できない' do
      @purchase_order.user_id = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では登録できない' do
      @purchase_order.item_id = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
    end
  end
end
