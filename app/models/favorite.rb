class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :youtuber

  validates_uniqueness_of :youtuber_id, scope: :user_id
end
