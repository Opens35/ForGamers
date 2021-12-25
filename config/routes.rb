Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions: 'admin/sessions'
  }
  root 'admin/categories#index'

  namespace :admin do
    resources :categories, except: [:new, :show]
    resources :blogs
  end
end
