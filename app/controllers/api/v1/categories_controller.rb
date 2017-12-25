class Api::V1::CategoriesController < ApplicationController
  
  swagger_controller :categories, "Category Management"  
  
  # GET /api/v1/categories
  #:nocov:
  swagger_api :index do
    summary  "Fetches all categories"
    response :ok
  end
  #:nocov:
  def index
    categories = ::Domain::Category::Presenters::List.new.call
    render json: categories
  end
end
