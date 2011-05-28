Translatio::Application.routes.draw do
  get "logs/index"
  get "logs/create"
  
  resources :languages
  resources :users

  get "translation/index"
  get "translation/begin"
  root :to => "translation#index"
end
