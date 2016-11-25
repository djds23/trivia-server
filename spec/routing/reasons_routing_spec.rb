require "rails_helper"

RSpec.describe ReasonsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/reasons").to route_to("reasons#index")
    end

    it "routes to #new" do
      expect(:get => "/reasons/new").to route_to("reasons#new")
    end

    it "routes to #show" do
      expect(:get => "/reasons/1").to route_to("reasons#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/reasons/1/edit").to route_to("reasons#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/reasons").to route_to("reasons#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/reasons/1").to route_to("reasons#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/reasons/1").to route_to("reasons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/reasons/1").to route_to("reasons#destroy", :id => "1")
    end

  end
end
