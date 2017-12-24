Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/apidocs' => redirect('/swagger-ui/dist/index.html?url=/docs/api-docs.json#/books')
  
  namespace :api do
    namespace :v1 do
      resources :books
    end
  end
end
