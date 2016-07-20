Rails.application.routes.draw do
<<<<<<< HEAD
  # resources :votes
  resources :legislators do
    resources :votes
    resources :comments
  end
=======
  
  resources :bills do
    resources :bill_comments
  end

  resources :legislators do
    resources :legislator_comments
  end

  resources :votes
>>>>>>> ext_api_connect
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
