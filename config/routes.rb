Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get  'welcome/login'

=begin
  get "/habitacion" index
  post "/habitacion" create
  delete "/habitacion" delete
  get "/habitacion/:id" show
  get "/habitacion/new" new
  get "/habitacion/:id/edit" edit
  patch "/habitacion/:id" update
  put "/habitacion/:id" update
=end
  resources :users
  resources :delete
  resources :habitacions
  resources :reservas
  resources :usuario
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
