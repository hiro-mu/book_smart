require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user). to be_valid
      end
      it 'passwordとpassword_confirmationが6字以上であれば登録できる' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        expect(@user). to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailが@を含まない場合は登録できない' do
        @user.email = "aaaaaa.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_conrfirmationが空では登録できない' do
        @user.password_confirmation =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it 'passwordとpassword_confirmationの値が違う場合には登録できない' do
        @user.password = "aaaaaaa"
        @user.password_confirmation = "bbbbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
