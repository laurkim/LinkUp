class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :users
  has_many :events, through: :users
  has_many :venues, through: :events
end
