class Bookmark < ApplicationRecord
  validates :page, presence: true
  belongs_to :book
end
