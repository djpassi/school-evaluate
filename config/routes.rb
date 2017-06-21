Rails.application.routes.draw do

  get 'users/change_role'

	devise_for :users
	devise_scope :user do
	  root to: "devise/sessions#new"
	end
	resources :answers
	resources :questions
	resources :survey_schemas
  resources :evaluations

  get '/home/change_rol', to: 'home#change_rol', as: '/home/change_rol'
	get '/home', to: 'home#index', as: 'index'
  get '/evaluate', to:'evaluations#evaluate'
	get "show_evaluation/:id", to:'evaluations#show_evaluation', as: 'show_evaluation'
  get "show_stadistics/:id", to:'evaluations#show_stadistics', as: 'show_stadistics'
	get "index_evaluations", to:'evaluations#index_evaluations', as: 'index_evaluations'
  get "user_evaluations", to:'evaluations#user_evaluations', as: 'user_evaluations'

  put 'users/:id/change_role' => "users#change_role", as: 'change_role'

  get "chart_example", to:'evaluations#chart_example', as: 'chart_example'

  get "users/:id", to:'users#show', as: 'users_show'
  get "users/", to:'users#index', as: 'users_index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
