require 'rails_helper'

describe Api::V1::RandomController, type: :controller do
  let! (:category) { Category.create!(title: 'testables') }

  describe '#index' do
    let!(:answer_text) { 'the answer' }

    before(:each) do
      101.times do |_|
        Card.create!(category: category, question: 'what is?', answer: answer_text)
      end
    end

    it 'returns the category as well' do
      get :index, params: { count: 1 }
      json_body = JSON.parse(response.body)
      card = json_body.first
      expect(card['category']).to be
    end

    context 'without any params' do
      it 'returns a default amount of 50' do
        get :index
        json_body = JSON.parse(response.body)
        expect(json_body.count).to eq 50
      end
    end

    context 'with count' do
      it 'gets a clue back' do
        get :index, params: { count: 1 }
        json_body = JSON.parse(response.body)
        expect(json_body.count).to eq 1
        expect(json_body.first['answer']).to eq answer_text
      end


      it 'gets the amount of clues requested as count' do
        get :index, params: { count: 100 }
        json_body = JSON.parse(response.body)
        expect(json_body.count).to eq 100
      end
    end
  end
end

