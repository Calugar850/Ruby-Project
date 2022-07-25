Rails.application.routes.draw do
  get 'courses/new'
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :schools
  resources :courses
  resources :chapters

  constraints subdomain: 'utcn' do
    resources :users_admin, :controller => 'users'
    get '/dashboard', to: 'users#index'
    get '/all_courses', to: 'courses#all_courses'
  end

  constraints subdomain: 'ubb' do
    resources :users_admin, :controller => 'users'
    get '/dashboard', to: 'users#index'
    get '/all_courses', to: 'courses#all_courses'
  end

end
