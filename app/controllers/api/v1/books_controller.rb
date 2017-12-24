class Api::V1::BooksController < ApplicationController

  swagger_controller :books, "Book Management"  

  # GET /api/v1/books
  #:nocov:
  swagger_api :index do
    summary  "Fetches all books with query or not"
    param    :query, :q, :string, :optional, "Query String"
    response :ok
  end
  #:nocov:
  def index
    books = ::Domain::Book::Presenters::Search.new(params).call
    render json: books 
  end

  #GET /api/v1/books/:book_id:
  #:nocov:
  swagger_api :show do
    summary "Fetches a single Book item"
    param :path, :id, :integer, :optional, "Book Id"
    response :ok, "Success", :User
    response :not_found
  end
  #:nocov:
  def show
    book = ::Domain::Book::Presenters::Show.new(params).call
    render json: book
  rescue ActiveRecord::RecordNotFound => error
    render json: { error: error.message }, status: :not_found
  end

  #POST /api/v1/books
  #:nocov:
  swagger_api :create do
    summary "Creates a new Book"
    param :form, :title, :string, :required, "Title"
    param :form, :pages, :integer, "Pages"
    param :form, :synopsis, :string, "Synopsis"
    param :form, :category_id, :integer, :required, "Category Id"
    param :form, :publisher_id, :integer, :required, "Publisher Id"
    param :form, :author_ids, :array, :required, "Author Ids"
    response :not_acceptable
  end
  #:nocov:
  def create
    book = ::Domain::Book::UseCases::Create.new(book_params).call
    render json: book, status: :created
  rescue ActiveRecord::RecordInvalid => error
    render json: { error: error.message }, status: :bad_request
  end

  #PUT/PATCH /api/v1/books/:book_id:
  #:nocov:
  swagger_api :update do
    summary "Updates an existing User"
    param :form, :title, :string, :required, "Title"
    param :form, :pages, :integer, "Pages"
    param :form, :synopsis, :string, "Synopsis"
    param :form, :category_id, :integer, :required, "Category Id"
    param :form, :publisher_id, :integer, :required, "Publisher Id"
    param :form, :author_id, :integer, :required, "Author Id"
    response :not_found
    response :not_acceptable
  end
  #:nocov:
  def update
    book = ::Domain::Book::UseCases::Update.new(book_params).call
    render json: book, status: :ok
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound => error
    render json: { error: error.message }, status: :bad_request
  end
  
  # DELETE /api/v1/books/:book_id:
  #:nocov:
  swagger_api :destroy do
    summary  "Deletes an existing book"
    param    :path, :id, :integer, :required, "Book ID"
    response :not_found
    response :no_content
  end
  #:nocov:
  def destroy
    ::Domain::Book::UseCases::Destroy.new(params).call
    head :no_content
  rescue ActiveRecord::RecordNotFound => error
    render json: { error: error.message }, status: :bad_request
  end

  private
    def book_params
      params.permit(:id, :title, :pages, :synopsis, :category_id, :publisher_id, :author_ids => [])
    end
end
