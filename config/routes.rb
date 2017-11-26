Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :vintages
    resources :settings
  end

  scope module: :front do
    root 'static_pages#home'
    get '/about', to: 'static_pages#about'
    get '/contacts', to: 'static_pages#contacts'
    get '/technology', to: 'static_pages#technology'
    get '/visit', to: 'static_pages#visit'
    get '/club', to: 'static_pages#club'
    get '/terra', to: 'static_pages#terra'
    get '/age_confirmation', to: 'static_pages#age_confirmation'
    resources :vintages, path: :wines do
      resources :wines, path: :vintages
    end
  end
end
