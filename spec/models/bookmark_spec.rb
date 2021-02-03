require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe 'ブックマーク保存' do
    before do
      @bookmark = FactoryBot.build(:bookmark)
    end

    context '保存できるとき' do
      it 'pagenumとbook_idがあれば登録できる' do
        expect(@bookmark).to be_valid
      end
    end

    context '保存できないとき' do
      it 'pagenumについての情報がなければ登録できない' do
        @bookmark.pagenum = ''
        @bookmark.valid?
        expect(@bookmark.errors.full_messages).to include("Pagenum can't be blank")
      end

      it 'book_idについての情報がなければ登録できない' do
        @bookmark.book = nil
        @bookmark.valid?
        expect(@bookmark.errors.full_messages).to include("Book must exist")
      end
    end
  end
end
