class ChangeLastfmColumnToString < ActiveRecord::Migration
  def change
    change_column :events, :lastfm_id, :string
  end
end
