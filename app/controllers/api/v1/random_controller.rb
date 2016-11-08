class Api::V1::RandomController < ApplicationController
  def index
    render json: CardCollector.new(count: count).as_json
  end
end
