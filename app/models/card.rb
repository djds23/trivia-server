class Card < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :reason
  scope :valid, -> { where('"cards"."deactivated_at" IS NULL') }
  scope :random, ->(count) { valid.order('RANDOM()').limit(count) }
end
