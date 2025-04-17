class Listen < ApplicationRecord
  belongs_to :album
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :rating, :inclusion => { :in => 1..10 }
end
