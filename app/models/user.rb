class User < ActiveRecord::Base
  has_secure_password

  has_many :ratings
  mount_uploader :photo, ImageUploader
  validates :username, :presence => true
end