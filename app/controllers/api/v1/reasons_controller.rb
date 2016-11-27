class Api::V1::ReasonsController < ApplicationController
  before_action :set_cache_headers

  # GET /reasons
  def index
    @reasons = Reason.where(deactivated_at: nil)

    render json: @reasons
  end

  private

  def set_cache_headers
    expires_in(1.hour, public: true, must_revalidate: true)
  end

  # Only allow a trusted parameter "white list" through.
  def reason_params
    params.require(:reason).permit(:display_name, :deactivated_at, :machine_name)
  end
end
