Rails.application.routes.draw do

	devise_for :users
	devise_scope :user do
	  root to: "devise/sessions#new"
	end
	resources :answers
	resources :questions
	resources :survey_schemas
  resources :evaluations


	get '/home', to: 'home#index', as: 'index'
  get '/evaluate', to:'evaluations#evaluate'
	get "show_evaluation/:id", to:'evaluations#show_evaluation', as: 'show_evaluation'
	get "index_evaluations", to:'evaluations#index_evaluations', as: 'index_evaluations'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
