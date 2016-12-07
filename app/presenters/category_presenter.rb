class CategoryPresenter
  attr_reader :category,
              :shuffle,
              :count

  def initialize(category_id:, count:, shuffle:)
    @category = Category.find(category_id)
    @shuffle = shuffle
    @count = count
  end

  def as_json(*args)
    view = category.as_json
    view[:cards] = cards
    view
  end

  private

  def cards
    card_relation = Card.where(category_id: category.id).order(:id).limit(count)
    puts shuffle
    if shuffle
      card_relation = card_relation.shuffle
    end
    card_relation
  end
end
