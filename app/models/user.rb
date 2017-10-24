class User < ApplicationRecord
  has_many :event_users
  has_many :events, through: :event_users
  has_many :venues, through: :events

  has_many :user_groups
  has_many :groups, through: :user_groups

  has_secure_password
end
