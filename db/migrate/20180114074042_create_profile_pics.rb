class CreateProfilePics < ActiveRecord::Migration
  def change
    create_table :profile_pics do |t|
      t.references :user, index: true, foreign_key: true
      t.string :photo1
      t.string :photo2
      t.string :youtube_video

      t.timestamps null: false
    end
  end
end
