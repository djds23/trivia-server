class Api::V1::CategoryController < ApplicationController

  before_action :set_cache_headers

  def index
    render json: Category.valid.with_count

  end

  def show
    render json: CategoryPresenter.new(
      category_id: category_id,
      count: count
    ).as_json
  end

  private

  def category_id
    params[:id].to_i
  end

  def count
   value = params[:count] || 100
   value.to_i
  end

  def category_params
    params.permit(:id, :count)
  end

  def set_cache_headers
    expires_in(1.hour, public: true, must_revalidate: true)
  end
end
