Rails.application.routes.draw do
  resources :channels do
    resources :conversations do
      resources :posts
    end
  end
  devise_for :users, controllers: { registrations: 'users/registrations'  }
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "channels#index"
end
