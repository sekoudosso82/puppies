Rails.application.routes.draw do 
  root to: "admin/owners#index"
  
  %w[admin reports].each do |space|
    namespace space do
      resources :owners do
        resources :dogs
      end 
      resources :dogs, only: [:index, :show] do
        resources :meals
      end
    end 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
