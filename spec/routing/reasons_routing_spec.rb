require "rails_helper"

describe Api::V1::ReasonsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "api/v1/reasons").to route_to("api_v1_reasons#index")
    end
  end
end
