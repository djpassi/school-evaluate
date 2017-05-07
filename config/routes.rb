Rails.application.routes.draw do

  resources :evaluations
	root to: "home#index"

	devise_for :users
	resources :answers
	resources :questions
	resources :survey_schemas

  get '/evaluate', to:'evaluations#evaluate'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
