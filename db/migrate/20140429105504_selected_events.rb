class SelectedEvents < ActiveRecord::Migration
  def change
    create_table :selected_events do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end
end
