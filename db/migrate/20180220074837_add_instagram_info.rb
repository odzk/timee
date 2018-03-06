class AddInstagramInfo < ActiveRecord::Migration
  def change
  	add_column :users, :instagram_token, :string
  	add_column :users, :instagram_id, :string
  	add_column :users, :instagram_username, :string
  	add_column :users, :instagram_profile_picture, :string
  	add_column :users, :instagram_bio, :string
	add_column :users, :instagram_website, :string
  end
end
