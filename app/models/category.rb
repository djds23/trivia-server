class Category < ApplicationRecord
  scope :valid, ->{ where(deactivated_at: nil) }
  has_many :cards
end
