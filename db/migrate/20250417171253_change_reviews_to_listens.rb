class ChangeReviewsToListens < ActiveRecord::Migration[8.0]
  def change
    rename_table :reviews, :listens
  end
end
