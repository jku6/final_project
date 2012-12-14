# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  username         :string(255)
#  password_digest  :string(255)
#  email            :string(255)
#  photo            :string(255)
#  admin            :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  oauth_expires_at :datetime
#  oauth_token      :string(255)
#  provider         :string(255)
#  uid              :string(255)
#

class User < ActiveRecord::Base
  # has_secure_password

  letsrate_rater

  # mount_uploader :photo, ImageUploader
  # validates :username, :presence => true
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.photo = auth.info.image
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
