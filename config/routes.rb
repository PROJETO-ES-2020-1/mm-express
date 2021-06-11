Rails.application.routes.draw do
  resources :encomendas
  root "welcome#index"
  get "welcome/index"
end
