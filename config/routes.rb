Rails.application.routes.draw do

  get 'pages/index'

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}
  resources :users

  root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
