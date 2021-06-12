Rails.application.routes.draw do
  resources :moradores
  resources :entrega_internas
  resources :entrega_externas
  resources :encomendas
  root "welcome#index"
  get "welcome/index"
end
