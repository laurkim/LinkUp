class Event < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :venue
end
