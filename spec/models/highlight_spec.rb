require 'rails_helper'

RSpec.describe Highlight, type: :model do
  describe 'ハイライト保存'
  before do
    @highlight = FactoryBot.build(:highlight)
  end

  context '保存できる時' do
    it '全ての項目の情報があれば登録できる' do
      expect(@highlight).to be_valid
    end
  end

  context '保存できない時' do
    it 'textについての情報がないと登録できない' do
      @highlight.text = ''
      @highlight.valid?
      expect(@highlight.errors.full_messages).to include("Text can't be blank")
    end

    it 'pagenumについての情報がないと保存できない' do
      @highlight.pagenum = ''
      @highlight.valid?
      expect(@highlight.errors.full_messages).to include("Pagenum can't be blank")
    end

    it 'book_idについての情報がないと保存できない' do
      @highlight.book = nil
      @highlight.valid?
      expect(@highlight.errors.full_messages).to include('Book must exist')
    end
  end
end
