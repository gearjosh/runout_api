class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :listens, dependent: :destroy
  has_many :likes, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
