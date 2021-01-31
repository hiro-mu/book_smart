class Book < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  has_one_attached :image
  has_one :page
  has_many :highlights
end
