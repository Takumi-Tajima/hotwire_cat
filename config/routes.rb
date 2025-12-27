Rails.application.routes.draw do
  root 'cats#index'

  resources :cats, only: %i[index show new edit create update destroy]
  resources :dogs, only: %i[index show new edit create update destroy]
  resources :chicks, only: %i[index show new edit create update destroy]
  resources :hedgehogs, only: %i[index show new edit create update destroy]
  resources :owls, only: %i[index show new edit create update destroy]

  get 'up' => 'rails/health#show', as: :rails_health_check
end
