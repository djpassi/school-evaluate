Rails.application.routes.draw do
	devise_for :users
	devise_scope :user do
	  root to: "devise/sessions#new"
	end
	resources :answers	
	resources :questions
	resources :survey_schemas

	get '/home', to: 'home#index', as: 'index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
