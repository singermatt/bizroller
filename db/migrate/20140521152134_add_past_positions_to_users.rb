class AddPastPositionsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :past_position_industry_1, :text
  	add_column :users, :past_position_company_name_1, :text
	add_column :users, :past_position_title_1, :text
	add_column :users, :past_position_industry_2, :text
	add_column :users, :past_position_company_name_2, :text
	add_column :users, :past_position_title_2, :text
	add_column :users, :past_position_industry_3, :text
	add_column :users, :past_position_company_name_3, :text 
	add_column :users, :past_position_title_3, :text
  end
end
