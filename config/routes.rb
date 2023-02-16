Rails.application.routes.draw do
  resources :countries do
    resources :regions do
      resources :cities
    end
  end

  root "pages#index"
end
