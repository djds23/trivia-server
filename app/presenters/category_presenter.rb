class CategoryPresenter
  attr_reader :category,
              :count

  def initialize(category_id:, count:)
    @category = Category.find(category_id)
    @count = count
  end

  def as_json(*args)
    view = category.as_json
    view[:cards] = cards
    view
  end

  private

  def cards
    Card.where(category_id: category.id).random(count)
  end
end
