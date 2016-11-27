class Category < ApplicationRecord
  scope :valid, ->{ where(deactivated_at: nil) }
  has_many :cards

  # find_by_sql returns an array, this breaks further chaining
  def self.valid_with_count(after_id: nil)
    sql = <<-SQL
      WITH card_count AS (
        SELECT DISTINCT cards.category_id, COUNT(cards.id) AS card_count
        FROM cards
        GROUP BY cards.category_id
      ) SELECT categories.*, card_count.card_count
      FROM categories
      INNER JOIN card_count ON categories.id = card_count.category_id
      WHERE
        categories.deactivated_at IS NULL
        AND categories.id > #{after_id.to_i}
    SQL

    find_by_sql(sql)
  end
end
