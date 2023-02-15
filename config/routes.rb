Rails.application.routes.draw do
  resources :countries do
    resources :regions
  end

  root "pages#index"
end
