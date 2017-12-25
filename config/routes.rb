Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/apidocs' => redirect('/swagger-ui/dist/index.html?url=/docs/api-docs.json#/books')
  
  namespace :api do
    namespace :v1 do
      resources :books
      resources :categories, only: [:index]
      resources :publishers, only: [:index]
      resources :authors,    only: [:index]
    end
  end
end
