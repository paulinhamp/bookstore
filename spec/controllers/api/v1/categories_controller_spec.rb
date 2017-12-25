require 'rails_helper'

describe Api::V1::CategoriesController, type: :controller do

  describe 'GET /api/v1/categories' do
    let!(:category) { create(:category) }
    
    context 'when request all categories' do
      it 'should return all registered' do
        get :index

        expect(response).to have_http_status(:ok)
        expect(json.count).to eq(1)
      end
    end
  end
end
