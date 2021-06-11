Rails.application.routes.draw do
  resources :entrega_internas
  root "welcome#index"
  get "welcome/index"
end
