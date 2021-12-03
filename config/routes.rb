Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
  controllers: { sessions: 'sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :tests_users, only: %i[show update] do
    resources :gists, only: :create
    member do
      get :attempt
    end
  end

  namespace :admin do
    resources :gists, only: %i[index destroy]
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
