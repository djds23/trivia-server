class Api::V1::DisableController < ApplicationController
  before_action :set_reason_and_card

  def create
    render json: CardFlag.where(card: @card, reason: @reason).first_or_create!
  end

  private
  def set_reason_and_card
    @reason = Reason.find(disable_params[:reason_id])
    @card = Card.find(disable_params[:card_id])
  end

  def disable_params
    params.require(:flag).permit(:card_id, :reason_id)
  end
end
