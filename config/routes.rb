Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  get 'welcome/index'
  post 'users/create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users do
    resources :articles do
      resources :comments
    end
  end
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
