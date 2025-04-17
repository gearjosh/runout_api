class Like < ApplicationRecord
  belongs_to :review
  belongs_to :user
  belongs_to :album
end
