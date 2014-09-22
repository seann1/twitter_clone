Rails.application.routes.draw do
  devise_for :users, :path => "accounts"

  resources :posts do
    resources :friendships
  end

  resources :users do
    resources :friendships
  end

  root to: "posts#index"
end
