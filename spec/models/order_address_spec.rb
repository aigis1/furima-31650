require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '正常動作' do
      expect(@order_address).to be_valid
    end

    it '郵便番号が空では保存されない' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号はハイフンが必要である' do
      @order_address.postal_code = '1111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end


    it '都道府県が選択されないといけない' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村の入力が必要である' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it '番値の入力が必須である' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it '建物は入力しなくても登録できる' do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end

    it '電話番号の入力が必須である' do
      @order_address.telephone = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
    end

    it '電話番号は数字のみでなくてはならない' do
      @order_address.telephone = '090-0000-0000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone number Input only number")
    end

    it '正しいカード情報の入力が必要である' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

  end
end
