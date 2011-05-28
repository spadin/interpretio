Translatio::Application.routes.draw do
  get "recordings/index"
  get "recordings/create"

  get "logs/list"
  get "logs/create"
  
  get "participants/list"
  
  resources :languages
  resources :users

  get "translation/index"
  get "translation/begin"
  root :to => "translation#index"
end
