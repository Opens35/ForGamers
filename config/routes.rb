Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions: 'admin/sessions'
  }
  root 'blogs#index'
  resources:blogs, only: [:index, :show] do
    resources :comments
  end

  namespace :admin do
    resources :categories, except: [:new, :show]
    resources :blogs
  end
end
