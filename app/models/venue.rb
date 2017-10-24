class Venue < ApplicationRecord
  has_many :events
  has_many :users, through: :events
  has_many :groups, through: :users
end
