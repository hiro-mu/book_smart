class Bookmark < ApplicationRecord
  validates :pagenum, presence: true
  belongs_to :book
end
