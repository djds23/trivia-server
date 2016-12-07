require 'rails_helper'

describe Api::V1::CategoryController, type: :controller do
  let! (:category) { Category.create!(title: 'testables') }
  let! (:answer_text) { 'this is the answer' }
  before(:each) do
    101.times do |_|
      Card.create!(category: category, question: 'what is?', answer: answer_text)
    end
  end

  describe '#index' do
    it 'returns an array of categories' do
      get :index
      json_body = JSON.parse(response.body)
      category_hash = json_body.find { |obj|
        obj['id'] == category.id && obj['title'] == category.title
      }
      expect(category_hash).to be
      expect(category_hash['card_count']).to eq 101
    end

    context 'with :last_category_id' do
      it 'only returns categories with an id greater than the last one seen' do
        get :index, last_category_id: category.id
        json_body = JSON.parse(response.body)
        expect(json_body).to be_empty
      end
    end
  end

  describe '#show' do
    it 'returns an array of categories' do
      get :show, id: category.id
      json_body = JSON.parse(response.body)
      expect(json_body['id']).to eq category.id
      expect(json_body['cards'].count).to eq 100
    end

    it 'shuffles cards by default' do
      get :show, id: category.id
      first_json_body = JSON.parse(response.body)['cards']

      get :show, id: category.id
      second_json_body = JSON.parse(response.body)['cards']

      expect(first_json_body).not_to eq second_json_body
    end

    context 'when passed a count param' do
      it 'returns an array of categories' do
        get :show, id: category.id, count: 25
        json_body = JSON.parse(response.body)
        expect(json_body['id']).to eq category.id
        expect(json_body['cards'].count).to eq 25
      end
    end

    context 'when told not to shuffle' do
      it 'does not shuffle cards' do
        get :show, id: category.id, shuffle: false, limit: 100
        first_json_body = JSON.parse(response.body)['cards']

        get :show, id: category.id, shuffle: false, limit: 100
        second_json_body = JSON.parse(response.body)['cards']

        expect(first_json_body).to eq second_json_body
      end
    end

    context 'when instructed to shuffle' do
      it 'shuffles cards' do
        get :show, id: category.id, shuffle: true, limit: 100
        first_json_body = JSON.parse(response.body)['cards']

        get :show, id: category.id, shuffle: true, limit: 100
        second_json_body = JSON.parse(response.body)['cards']

        expect(first_json_body).not_to eq second_json_body
      end
    end
  end
end

