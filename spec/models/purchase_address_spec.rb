require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '住所情報と購入履歴の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end
    context '住所情報が保存できる場合' do
      it '配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること' do
        expect(@purchase_address).to be_valid
      end
    end
    context '住所情報が保存できない場合' do
      it '郵便番号にはハイフンが必要であること（123-4567となる）' do
        @purchase_address.postal_code = '4356431'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号が4桁-3桁の場合は保存がされないこと' do
        @purchase_address.postal_code = '1234-567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号がなければ保存されないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県を選択しなければ保存されないこと' do
        @purchase_address.prefecture_id = (1)
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村を入力しないと保存されないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '市区町村が半角英数字だと保存されないこと' do
        @purchase_address.city = 'test'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('City is invalid. Input full-width characters')
      end
      it '市区町村が全角英数字だと保存されないこと' do
        @purchase_address.city = 'TEST'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('City is invalid. Input full-width characters')
      end
      it '番地を入力しないと保存されないこと' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号にハイフンがあると保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が全角英数字だと保存できないこと' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid, Input your phone number')
      end
    end
    context '購入履歴が保存できる場合' do
      it 'tokenが入力されていると購入履歴が保存される' do
        expect(@purchase_address).to be_valid
      end
    end
    context '購入履歴が保存されない場合' do
      it 'tokenが入力されていないと保存できないこと' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
