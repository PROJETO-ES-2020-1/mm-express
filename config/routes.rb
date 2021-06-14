Rails.application.routes.draw do
  get 'sessions/new'
  resources :usuarios
  resources :entrega_internas
  resources :entrega_externas
  resources :encomendas
  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  root 'sessions#new'
end
