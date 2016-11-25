class Api::V1::ReasonsController < ApplicationController
  before_action :set_reason, only: [:show, :update, :destroy]

  # GET /reasons
  def index
    @reasons = Reason.all

    render json: @reasons
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reason
    @reason = Reason.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def reason_params
    params.require(:reason).permit(:display_name, :deactivated_at, :machine_name)
  end
end
