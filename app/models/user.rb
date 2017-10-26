class User < ApplicationRecord
  has_many :event_users
  has_many :events, through: :event_users
  has_many :venues, through: :events

  has_many :user_groups
  has_many :groups, through: :user_groups

  has_many :comments

  has_many :likes

  mount_uploader :image, ImageUploader

  has_secure_password

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
