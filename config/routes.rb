Rails.application.routes.draw do

	root 'home#top'
	get 'home/about'
	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :books do
    resources :book_comments, only: [:create, :destroy]
	  resource :favorites, only: [:create, :destroy]
  end
end
