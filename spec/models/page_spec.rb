require 'rails_helper'

RSpec.describe Page, type: :model do
  describe 'ページ保存' do
    before do
      @page = FactoryBot.build(:page)
    end

    context '登録できる時' do
      it 'book_idとpagenumについての情報があれば登録できる' do
        expect(@page).to be_valid
      end
    end

    context '登録できない時' do
      it 'pagenumについての情報がないと登録できない' do
        @page.pagenum = ""
        @page.valid?
        expect(@page.errors.full_messages).to include("Pagenum can't be blank")
      end

      it 'book_idについての情報がないと登録できない' do
        @page.book = nil
        @page.valid?
        expect(@page.errors.full_messages).to include("Book must exist") 
      end
    end
  end
end
