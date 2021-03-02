Rails.application.routes.draw do 
  root to: "owners#index"
  resources :owners do
    resources :dogs
  end

  resources :dogs do
    resources :meals
  end
  
  # resources :meals
  # resources :dogs
  # resources :owners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
