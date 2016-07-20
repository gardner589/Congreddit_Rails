Rails.application.routes.draw do
  
  resources :bills do
    resources :bill_comments
  end

  resources :legislators do
    resources :legislator_comments
  end

  resources :votes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
