class User < ApplicationRecord



before_validation :downcase_email

private

def downcase_email
  self.email = email.downcase if email.present?
end

  has_secure_password
  validates :email,format:{with: /.*@.*/}

  mount_uploader :profile_pic, ImageUploader
end
