class SelectedArtists < ActiveRecord::Migration
  def change
    create_table :selected_artists do |t|
      t.integer :artist_id
      t.integer :user_id
      t.timestamps
    end
  end
end
