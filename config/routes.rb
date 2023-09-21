Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments
  end

  #resources :brackets

  # config/routes.rb
  post '/test_render_bracket', to: 'brackets#test_render_bracket'

  # config/routes.rb
  resources :brackets do
    get 'get_bracket_with_players', on: :member # Replace :your_controller with your actual controller name
  end

end
