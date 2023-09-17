Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments
  end

  resources :brackets do
    collection do
      post 'create_bracket'
    end
  end
end
