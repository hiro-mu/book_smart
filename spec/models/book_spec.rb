require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '本新規登録' do
    before do
      @item = FactoryBot.build(:book)
    end

    context '登録できるとき' do
      it 'titleとcontent、imageがあれば登録できる' do
        expect(@item).to be_valid
      end

      it 'titleとcontentがあれば登録できる' do
        @item.image = ""
        expect(@item).to be_valid
      end
    end

    context '登録できないとき' do
      it 'titleがないと登録できない' do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank") 
      end

      it 'contentがないと登録できない' do
        @item.content = ""
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
    end
  end

end
