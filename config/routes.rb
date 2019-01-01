Rails.application.routes.draw do
  root 'links#index'
  resources :links, only: %i(index create)
  get '/redirect/:short_id', to: 'redirect#redirect', as: :redirect
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :links, only: %i(index show)
      post 'links/create', to: 'links#create', as: :links_create
    end
 end
end
