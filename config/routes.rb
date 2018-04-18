Rails.application.routes.draw do
  get 'assignment/index'

  get 'assignment/new'

  get 'assignment/show'

  get 'home/index'

  get 'enrollment/enroll'
  post 'assignment/create'
  post 'assignment/update'
  post 'assignment/new'
  post 'assignment/show' 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Home Page
  root to: "home#index"
  get 'home/study'

  # Enrollment Page
  get 'enrollment/new'
  post 'enrollment/create'
  get 'enrollment/index'
  get 'enrollment/grade'
  get 'enrollment/update'
  post 'enrollment/update'
  patch 'enrollment/update'
  get 'enrollment/enrollments'

  # Manage Courses
  resources :courses
  devise_for :users

  resources :discussions do
    resources :replies
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
