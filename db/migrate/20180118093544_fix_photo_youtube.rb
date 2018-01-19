class FixPhotoYoutube < ActiveRecord::Migration
  def change
    add_column :profile_pics, :photo3, :string
  end
end
