class Api::V1::PublishersController < ApplicationController
  
  swagger_controller :publishers, "Publisher Management"  
  
  # GET /api/v1/publishers
  #:nocov:
  swagger_api :index do
    summary  "Fetches all publishers"
    response :ok
  end
  #:nocov:
  
  def index
    publishers = ::Domain::Publisher::Presenters::List.new.call
    render json: publishers
  end
end
