Rails.application.routes.draw do
  resources :answers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index
  end
end
