class AddCurrentPositionFields < ActiveRecord::Migration
  def change
	add_column :users, :current_position_industry_1, :text
  end
end
