Translatio::Application.routes.draw do
  get "translation/index"
  get "translation/begin"
  root :to => "translation#index"
end
