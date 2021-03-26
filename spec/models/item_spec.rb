require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'name,info,price,sales_id,prefecture_id,scheduled_id,category_id,shipping_id,imageが空だと登録できない' do
      expect(@item).to be_valid
    end

    it 'nameが空の場合は登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'infoが空の場合は登録できない' do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it 'priceが空の場合は登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceが300円以下の場合は登録ができない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than 300')
    end

    it 'priceが9999999円以上の場合は登録ができない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 9999999')
    end

    it 'priceが全角の場合登録できないこと' do
      @item.price = '９８７'
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'sales_idが選択されていないと登録できない' do
      @item.sales_id = (1)
      @item.valid?
      expect(@item.errors.full_messages).to include('Sales must be other than 1')
    end
    it 'prefecture_idが選択されていないと登録できない' do
      @item.prefecture_id = (0)
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
    end
    it 'scheduled_idが選択されていないと登録できない' do
      @item.scheduled_id = (1)
      @item.valid?
      expect(@item.errors.full_messages).to include('Scheduled must be other than 1')
    end
    it 'category_idが選択されていないと登録できない' do
      @item.category_id = (1)
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it 'shipping_idが選択されていないと登録できない' do
      @item.shipping_id = (1)
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping must be other than 1')
    end

    it '画像が選択されていないと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
