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

  # config/routes.rb
  post '/test_render_bracket', to: 'brackets#test_render_bracket'

end
