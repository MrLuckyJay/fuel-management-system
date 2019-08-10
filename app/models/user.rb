class User < ApplicationRecord
  has_secure_password

  mount_uploader :profile_pic, ImageUploader
end
