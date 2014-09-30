Rails.application.routes.draw do
  devise_for :users, :path => "accounts"

  resources :posts do
    resources :friendships
  end

  resources :users do
    resources :friendships
  end

  # match('/users', :via => "patch", :to => 'profiles#charities_show')

  root to: "posts#index"
end
