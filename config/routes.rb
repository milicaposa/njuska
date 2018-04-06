Rails.application.routes.draw do
  # routes for users
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  # routes for animals
  resources :animals do
    collection do
      resources :adoptions, only: [:index] do
        collection do
          get :all
          get :dogs
          get :cats
          get :other
        end
      end

      resources :missings, only: [:index] do
        collection do
          get :all
          get :dogs
          get :cats
          get :other
        end
      end
    end

    member do
      get :show_single
    end
  end

  # routes for pages
  get 'about', to: 'pages#about'
  get 'news',  to: 'pages#news'

  # root routes
  root 'animals#home'
end
