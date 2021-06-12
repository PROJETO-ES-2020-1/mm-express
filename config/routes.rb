Rails.application.routes.draw do
  resources :entrega_internas
  resources :entrega_externas
  resources :encomendas
  root "welcome#index"
  get "welcome/index"
end
