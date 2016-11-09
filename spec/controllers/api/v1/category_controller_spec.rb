require 'rails_helper'

describe Api::V1::CategoryController, type: :controller do
  let! (:category) { Category.create!(title: 'testables') }

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
end
