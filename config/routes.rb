Rails.application.routes.draw do
  #resources :boards
  get '/boards/:id', to: 'boards#show', as: 'board'
  get '/read_character', to: 'boards#read_character'
  root 'boards#index'
  
end
