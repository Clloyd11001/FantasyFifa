Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments
  end

  # Add the brackets resources
  resources :brackets, only: [:create, :show, :new] do
    member do
      get :render_bracket # Add a custom route for render_bracket action
    end
  end
end
