class AddLinkedinNumConnectionsColumn < ActiveRecord::Migration
  def change
	add_column :users, :num_connections, :integer
  end
end
