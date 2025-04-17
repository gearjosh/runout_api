class FixContentName < ActiveRecord::Migration[8.0]
  def change
    rename_column :listens, :content, :review
  end
end
