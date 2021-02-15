require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '本新規登録' do
    before do
      @book = FactoryBot.build(:book)
    end

    context '登録できるとき' do
      it 'titleとcontent、image、user_idがあれば登録できる' do
        expect(@book).to be_valid
      end

      it 'titleとcontent、user_idがあれば登録できる' do
        @book.image = ''
        expect(@book).to be_valid
      end
    end

    context '登録できないとき' do
      it 'titleがないと登録できない' do
        @book.title = ''
        @book.valid?
        expect(@book.errors.full_messages).to include("Title can't be blank")
      end

      it 'contentがないと登録できない' do
        @book.content = ''
        @book.valid?
        expect(@book.errors.full_messages).to include("Content can't be blank")
      end

      it 'user_idがないと登録できない' do
        @book.user = nil
        @book.valid?
        expect(@book.errors.full_messages).to include("User must exist")
      end
    end
  end
end
