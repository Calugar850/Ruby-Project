require_relative "../lib/route_constraints/user_exists"

Rails.application.routes.draw do
  #get 'admin/new'
  devise_for :users
  #get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :user, param: :domain
  root "home#index"

  #scope "/:domain", constraints: RouteConstraints::UserExists do
  #  get "/", to: "home#show"
  #end
  #get '/a', to: 'home#show', constraints: { subdomain: ':domain' }

  constraints subdomain: 'utcn' do
    get '/dashboard', to: 'home#show'
    get '/new_user', to: 'home#new'
  end

  constraints subdomain: 'ubb' do
    get '/dashboard', to: 'home#show'
    get '/new_user', to: 'home#new'
  end

end
