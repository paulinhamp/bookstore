class Api::V1::AuthorsController < ApplicationController

  swagger_controller :authors, "Author Management"  
  
  # GET /api/v1/authors
  #:nocov:
  swagger_api :index do
    summary  "Fetches all authors"
    response :ok
  end
  #:nocov:
  def index
    authors = ::Domain::Author::Presenters::List.new.call
    render json: authors
  end
end
