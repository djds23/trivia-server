class Category < ApplicationRecord
  scope :valid, ->{ where(deactivated_at: nil) }
  scope :with_count, ->{
    find_by_sql <<-SQL
      WITH card_count AS (
        SELECT DISTINCT cards.category_id, COUNT(cards.id) AS card_count
        FROM cards
        GROUP BY cards.category_id
      ) SELECT categories.*, card_count.card_count
      FROM categories
      INNER JOIN card_count ON categories.id = card_count.category_id
    SQL
  }

  has_many :cards
end
