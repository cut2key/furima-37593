require 'rails_helper'

RSpec.describe Item, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品' do
    context '新規出品できる場合' do
      it "item_name, item_description, category_id, quality_id, ship_fee_id, country_id, ship_day_id, priceが存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it "item_nameが空では出品できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_descriptionが空では出品できない" do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it "category_idが空では出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "quality_idが空では出品できない" do
        @item.quality_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it "ship_fee_idが空では出品できない" do
        @item.ship_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship fee can't be blank")
      end
      it "country_idが空では出品できない" do
        @item.country_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Country can't be blank")
      end
      it "ship_da_idが空では出品できない" do
        @item.ship_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end
      it "priceが空では出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "priceに半角数字以外の文字(全角数字・漢字・カタカナ・ひらがな・英字・記号)が含まれていると登録できない" do
        @item.price = '１亜あアaA!'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "priceは¥300~¥9,999,999の間以外だと登録できない" do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end
