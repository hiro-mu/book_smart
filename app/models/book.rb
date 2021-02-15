class Book < ApplicationRecord
  has_one_attached :image
  has_one :bookmark
  has_many :highlights
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :content
  end
end
