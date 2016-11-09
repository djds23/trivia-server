class Api::V1::CategoryController < ApplicationController

  def index
    render json: Category.valid
  end

  def show
    render json: Card.where(category_id: category_id)
  end

  private

  def category_id
    params[:id].to_i
  end

  def category_params
    params.permit(:id)
  end
end
