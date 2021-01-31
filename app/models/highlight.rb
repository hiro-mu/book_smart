class Highlight < ApplicationRecord
  validates :text, presence: true
  validates :pagenum, presence: true
  belongs_to :book
end
