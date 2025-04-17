class Album < ApplicationRecord
  has_many :listens, dependent: :destroy
  has_many :likes, dependent: :destroy
end
