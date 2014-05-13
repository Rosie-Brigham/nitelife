class AddArtistIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :artist_id, :integer
    remove_column :events, :artist, :string
  end
end
