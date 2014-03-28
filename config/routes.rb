Shareup::Application.routes.draw do
  root to: 'welcome#index'
  get '/dashboard' => 'welcome#dashboard'

  namespace :api do
    resources :shares
  end

  devise_for :users,
             controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
end
