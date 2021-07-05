Rails.application.routes.draw do
  get "sessions/new"

  resources :solicitacao_repasses
  resources :sobreaviso_de_entregas

  resources :usuarios

  resources :entrega_internas
  resources :entrega_externas
  resources :encomendas

  get "sign_in" => "sessions#new"
  post "sign_in" => "sessions#create"
  delete "sign_out" => "sessions#destroy"

  root "sessions#new"
end
