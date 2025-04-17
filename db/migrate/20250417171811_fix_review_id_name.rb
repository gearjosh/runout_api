class FixReviewIdName < ActiveRecord::Migration[8.0]
  def change
    rename_column :likes, :review_id, :listen_id
  end
end
