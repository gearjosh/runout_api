class AddGenreTagsToAlbums < ActiveRecord::Migration[8.0]
  def change
    add_column :albums, :genre_tags, :text, array: true, default: []
  end
end
