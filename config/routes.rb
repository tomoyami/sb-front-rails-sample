Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :users do
    collection do
      get :sign_in
      post :sign_in
    end
  end
  resources :events
end
