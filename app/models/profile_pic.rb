class ProfilePic < ActiveRecord::Base
  belongs_to :user
  
  mount_uploader :picture, PictureUploader
  mount_uploader :picture2, PictureUploader
  mount_uploader :picture3, PictureUploader
end
