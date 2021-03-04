Rails.application.routes.draw do 
  root to: "admin/owners#index"
  namespace :admin do
    resources :owners do
      resources :dogs
    end 
    resources :dogs, only: [:show] do
      resources :meals
    end
  end

  
  # resources :meals
  # resources :dogs
  # resources :owners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
