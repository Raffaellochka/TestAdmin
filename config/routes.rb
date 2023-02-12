Rails.application.routes.draw do
  resources :countries

  root "pages#index"
end
