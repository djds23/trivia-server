require 'rails_helper'

RSpec.describe "Reasons", type: :request do
  describe "GET /reasons" do
    it "works! (now write some real specs)" do
      get reasons_path
      expect(response).to have_http_status(200)
    end
  end
end
