require 'rails_helper'

describe API::V1::CardController, type: :controller do
  describe '#random' do
    it 'gets a clue back' do
      get :random, params: { count: 1 }
      json_body = JSON.parse(response.body).first
      expect(json_body[:answer]).to be
    end

    it 'gets the amount of clues requested as count' do
      get :random, params: { count: 100 }
      json_body = JSON.parse(response.body)
      expect(json_body.count).to eq 100
    end
  end
end

