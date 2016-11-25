require 'rails_helper'

describe "Reasons", type: :request do
  describe "GET /reasons" do
    it "works! (now write some real specs)" do
      get api_v1_reasons_path
      expect(response).to have_http_status(200)
    end
  end
end
