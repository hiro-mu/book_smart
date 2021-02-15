class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :books
  has_many :highlights
  has_many :bookmarks

  with_options presence: true do
    validates :name
  end
  
end
