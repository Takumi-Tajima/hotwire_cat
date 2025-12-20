Rails.application.routes.draw do
  resources :cats, only: %i[index show new edit create update destroy]

  get 'up' => 'rails/health#show', as: :rails_health_check
end
