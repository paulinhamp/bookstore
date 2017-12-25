require 'rails_helper'

describe Api::V1::PublishersController, type: :controller do
  describe 'GET /api/v1/publishers' do
    let!(:publisher) { create(:publisher) }
    
    context 'when request all publishers' do
      it 'should return all registered' do
        get :index

        expect(response).to have_http_status(:ok)
        expect(json.count).to eq(1)
      end
    end
  end
end
