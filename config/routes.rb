Rails.application.routes.draw do
  resources :work_sessions
  resources :task_labels
  resources :labels
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
