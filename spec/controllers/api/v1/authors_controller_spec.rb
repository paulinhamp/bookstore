require 'rails_helper'

describe Api::V1::AuthorsController, type: :controller do

  describe 'GET /api/v1/authors' do
    let!(:author) { create(:author) }
    
    context 'when request all authors' do
      it 'should return all registered' do
        get :index

        expect(response).to have_http_status(:ok)
        expect(json.count).to eq(1)
      end
    end
  end
end
