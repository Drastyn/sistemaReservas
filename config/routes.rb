Rails.application.routes.draw do
  get 'habitaciones/habitaciones'
  root 'welcome#index'
  get  'welcome/login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
