class AddMoreLinkedinFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :description, :text
    add_column :users, :image, :string
    add_column :users, :headline, :text
    add_column :users, :industry, :string
    add_column :users, :public_profile, :string
  end
end
