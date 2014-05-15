class ChangeLastIdColumnName < ActiveRecord::Migration
  def change
    rename_column :events, :last_id, :lastfm_id
  end
end
