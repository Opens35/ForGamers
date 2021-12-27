Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions: 'admin/sessions'
  }
  root 'blogs#index'
  get 'pv_ranking', to: 'blogs#pv_ranking'
  get '/blogs/genre/:id', to: "blogs#genre"

  resources :categories, only: [:index, :show]

  resources :blogs, only: [:index, :show] do
    resources :comments
  end

  namespace :admin do
    resources :categories
    resources :blogs
  end
end
