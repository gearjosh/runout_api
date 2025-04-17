class CreateAlbums < ActiveRecord::Migration[8.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.text :tracklist, array: true, default: []
      t.string :cover

      t.timestamps
    end
  end
end
