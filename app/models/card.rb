class Card < ApplicationRecord
  belongs_to :category
  scope :valid, -> { where('"cards"."deactivated_at" IS NULL') }
  scope :random, ->(count) { valid.order('RANDOM()').limit(count) }
end
