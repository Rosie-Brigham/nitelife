class AddLastIdColomnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :last_id, :integer
  end
end
