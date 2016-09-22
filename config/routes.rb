Rails.application.routes.draw do
  #resources :boards
  get '/boards/:id', to: 'boards#show', as: 'board'
  root 'boards#index'
  
end
