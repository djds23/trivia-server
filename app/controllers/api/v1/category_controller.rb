class Api::V1::CategoryController < ApplicationController

  def index
    render json: Category.valid
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
    params[:count] || 100
  end

  def category_params
    params.permit(:id, :count)
  end
end
