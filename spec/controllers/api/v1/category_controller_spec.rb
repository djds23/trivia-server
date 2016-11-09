require 'rails_helper'

describe Api::V1::CategoryController, type: :controller do
  let! (:category) { Category.create!(title: 'testables') }
  let! (:answer_text) { 'this is the answer' }

  describe '#index' do
    it 'returns an array of categories' do
      get :index
      json_body = JSON.parse(response.body)
      category_hash = json_body.find { |obj|
        obj['id'] == category.id && obj['title'] == category.title
      }
      expect(category_hash).to be
    end
  end

  describe '#show' do
    before(:each) do
      101.times do |_|
        Card.create!(category: category, question: 'what is?', answer: answer_text)
      end
    end

    it 'returns an array of categories' do
      get :show, id: category.id
      json_body = JSON.parse(response.body)
      expect(json_body['id']).to eq category.id
      expect(json_body['cards'].count).to eq 100
    end

    context 'when passed a count param' do
      it 'returns an array of categories' do
        get :show, id: category.id, count: 25
        json_body = JSON.parse(response.body)
        expect(json_body['id']).to eq category.id
        expect(json_body['cards'].count).to eq 25
      end
    end
  end
end
