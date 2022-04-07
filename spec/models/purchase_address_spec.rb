require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zip_codeが空だと保存できないこと' do
        @purchase_address.zip_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.zip_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
      end
      it 'country_idを選択していないと保存できないこと' do
        @purchase_address.country_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Country can't be blank")
      end
      it 'cityが空だと保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'st_addressが空だと保存できない' do
        @purchase_address.st_address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("St address can't be blank")
      end
      it 'phone_numが空だと保存できない' do
        @purchase_address.phone_num = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが-を含んだ入力だと保存できない' do
        @purchase_address.phone_num = '123-456-7890'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone num is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
