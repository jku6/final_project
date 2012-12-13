class User < ActiveRecord::Base
  has_secure_password

  letsrate_rater
  
  mount_uploader :photo, ImageUploader
  validates :username, :presence => true
end