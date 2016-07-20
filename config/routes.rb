Rails.application.routes.draw do
  # resources :votes
  resources :legislators
  resources :votes
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
