Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students, :controllers => {:registrations => "students/registrations"}
  resources :teachers, only: [:show]
  resources :students, only: [:show]
  resources :courses
  resources :attendances
  resources :subjects
  resources :learning
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
