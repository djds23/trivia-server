class ApplicationController < ActionController::API
  before_action :set_cache_headers

  def set_cache_headers
    expires_in(24.hours, public: true)
  end
end
