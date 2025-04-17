class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :listens, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follower_relationships, foreign_key: :followee_id, class_name: "Relationship"
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :followee_relationships, foreign_key: :follower_id, class_name: "Relationship"
  has_many :followees, through: :followee_relationships, source: :followee

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
