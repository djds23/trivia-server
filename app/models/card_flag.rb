class CardFlag < ApplicationRecord
  belongs_to :card
  belongs_to :reason
end
