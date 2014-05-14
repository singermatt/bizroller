class AddCurrentPositionFields < ActiveRecord::Migration
  def change
	add_column :users, :current_position_1, :text
  end
end
