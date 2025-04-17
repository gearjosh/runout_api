class AddSummaryToAlbums < ActiveRecord::Migration[8.0]
  def change
    add_column :albums, :summary, :text
  end
end
