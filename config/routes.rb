Translatio::Application.routes.draw do
  get "recordings/index"
  get "recordings/create"
  
  get "participants/create"
  get "participants/list"

  get "logs/list"
  get "logs/create"
  
  resources :conferences
  resources :languages
  resources :users
  resources :translations
  resources :participants

  get "translation/index"
  get "translation/begin"
  root :to => "translation#index"
end
