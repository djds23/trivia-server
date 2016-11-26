require 'rails_helper'

describe Api::V1::FlagController, type: :controller do

  let!(:reason) {
    Reason.where(
      machine_name: 'demo',
      display_name: 'Demo'
    ).first_or_create!
  }

  let!(:card) {
    Card.where(
      question: 'whatever?',
      answer: 'okay!',
      category: Category.where(title: "animals").first_or_create!
    ).first_or_create!
  }

  let!(:create_params) {
    {
      flag: {
        card_id: card.id,
        reason_id: reason.id
      }
    }
  }

  describe "GET #create" do
    it "returns http success" do
      post :create, create_params
      expect(response).to have_http_status(:success)
    end
  end

end
