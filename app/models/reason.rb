class Reason < ApplicationRecord
  has_and_belongs_to_many :card
end
