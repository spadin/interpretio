Translatio::Application.routes.draw do
  get "logs/index"
  get "logs/create"

  get "translation/index"
  get "translation/begin"
  root :to => "translation#index"
end
