class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :genre
      t.string :venue
      t.string :artist
      t.string :url
      t.string :email
      t.text :description
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
