class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :profile_picture, ProfilePictureUploader
  # Validaciones
  validates :first_name, :last_name, :phone, :email, presence: true
end