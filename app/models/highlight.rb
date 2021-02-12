class Highlight < ApplicationRecord
  belongs_to :book
  belongs_to :user

  with_options presence: true do
    validates :text
    validates :pagenum
  end

end
