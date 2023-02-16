Rails.application.routes.draw do
  resources :countries do
    resources :regions do
      resources :cities do
        resources :hostels
      end
    end
  end
  root "pages#index"
end
