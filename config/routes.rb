Rails.application.routes.draw do
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    registrations: 'admin_users/registrations',
    passwords: 'admin_users/passwords'
  }
  namespace :admin do
    resources :students
    resources :courses
    resources :projects
    resources :blogs
    get 'dashboard' => 'dashboard#index'
  end
  root 'welcome#index'
  get 'welcome/about_us'
  get 'welcome/contact_us'

  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html
end
