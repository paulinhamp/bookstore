require 'rails_helper'

describe Api::V1::BooksController, type: :controller do

  before {
    allow(::Domain::Redis::RedisWrapper).to receive(:redis_client).and_return(::Support::Mocks::Redis.new)
    allow(InvalidateCacheWorker).to receive(:perform_async)
  }

  describe 'GET /api/v1/books' do
    let!(:book1) { create(:book) }
    let!(:book2) { create(:book) }

    context 'when request all books' do
      it 'should return all registered' do
        get :index

        expect(response).to have_http_status(:ok)
        expect(json.count).to eq(2)
      end
    end
  end

  describe 'GET /api/v1/books/:book_id' do
    context 'when id is invalid' do
      it 'should return an error' do
        get :show, params: { id: 1 }.as_json

        expect(response).to have_http_status(:not_found)
        expect(json['error']).to eq('Couldn\'t find Book with \'id\'=1')
      end
    end

    context 'when id is valid' do
      let(:book) { create(:book) }

      it 'should return the book' do
        get :show, params: { id: book.id }.as_json

        expect(response).to have_http_status(:ok)
        expect(json.to_json).to eq(BookSerializer.new(book).to_json)
      end
    end
  end

  describe 'POST /api/v1/books' do
    let!(:book) { build(:book).as_json }
  
    context 'when request to create a book' do
      before {
        book['author_ids'] = [ Author.first.id ]
      }

      it 'should create this one' do
        post :create, params: book, format: :json

        expect(response).to have_http_status(:created)
        expect(json['title']).to eq(book['title'])
        expect(Book.first.authors.count).to eq(1)
      end
    end

    context 'when request to create a book is invalid' do
      it 'should raise an error' do
        post :create, params: book, format: :json

        expect(response).to have_http_status(:bad_request)
        expect(json['error']).to eq('Validation failed: Authors can\'t be blank')
      end
    end
  end

  describe 'PUT /api/v1/books/:book_id:' do
    let!(:book) { create(:book) }
  
    context 'when request to update a book' do
      let!(:params) { { title: 'My Awesome Book' } }

      it 'should update this one' do
        put :update, params: { 'id' => book.id }.merge(params).as_json, format: :json

        expect(response).to have_http_status(:ok)
        expect(json['title']).to eq(params[:title])
      end
    end

    context 'when request to update a book is invalid' do
      let!(:params) { { title: '' } }

      it 'should raise an error' do
        put :update, params: { 'id' => book.id }.merge(params).as_json, format: :json

        expect(response).to have_http_status(:bad_request)
        expect(json['error']).to eq('Validation failed: Title can\'t be blank')
      end
    end
  end

  describe 'DELETE /api/v1/books/:book_id:' do
    let!(:book) { create(:book) }
  
    context 'when request to delete a book' do

      it 'should delete this one' do
        delete :destroy, params: { 'id' => book.id }, format: :json

        expect(response).to have_http_status(:no_content)
        expect(Book.count).to eq(0)
      end
    end

    context 'when request to delete a book is invalid' do
      it 'should raise an error' do
        delete :destroy, params: { 'id' => book.id + 10 }, format: :json

        expect(response).to have_http_status(:bad_request)
        expect(json['error']).to eq("Couldn't find Book with 'id'=#{book.id + 10}")
      end
    end
  end
end
