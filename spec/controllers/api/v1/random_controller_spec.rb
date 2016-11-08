require 'rails_helper'

describe Api::V1::RandomController, type: :controller do
  describe '#index' do
    it 'gets a clue back' do
      get :index, params: { count: 1 }
      json_body = JSON.parse(response.body).first
      expect(json_body['answer']).to be
    end

    it 'gets the amount of clues requested as count' do
      get :index, params: { count: 100 }
      json_body = JSON.parse(response.body)
      expect(json_body.count).to eq 100
    end
  end
end

