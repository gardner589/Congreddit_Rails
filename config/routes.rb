Rails.application.routes.draw do

  resources :legislators do
    resources :votes
    resources :legislator_comments
  end

  resources :bills do
    resources :bill_comments
  end

  resources :legislators do
  end

  # resources :votes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
