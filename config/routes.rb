Rails.application.routes.draw do
  root 'admin/categories#index'
  # 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :categories, except: [:new, :show]
  end
end
