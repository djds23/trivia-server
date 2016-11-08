class Api::V1::RandomController < ApplicationController
  def index
    render json: Card.random(count).as_json(include: :category)
  end

  private

  def count
    whitelisted_params[:count] || 50
  end

  def whitelisted_params
    params.permit(:count)
  end
end
