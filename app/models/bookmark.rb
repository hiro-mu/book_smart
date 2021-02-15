class Bookmark < ApplicationRecord
  belongs_to :book
  belongs_to :user

  with_options presence: true do
    validates :pagenum
  end
end
