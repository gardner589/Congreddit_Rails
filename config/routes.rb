Rails.application.routes.draw do
  # resources :votes
  resources :legislators do
    resources :votes
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
