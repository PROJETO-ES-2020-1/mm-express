Rails.application.routes.draw do
  resources :solicitacao_repasses
  resources :sobreaviso_de_entregas
  get "sessions/new"
  resources :usuarios
  resources :entrega_internas
  resources :entrega_externas
  resources :encomendas

  resources :usuarios do
    resources :encomendas
    resources :entrega_internas
  end

  get "sign_in" => "sessions#new"
  post "sign_in" => "sessions#create"
  delete "sign_out" => "sessions#destroy"

  root "sessions#new"
end
