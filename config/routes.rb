Rails.application.routes.draw do
  post "/:id/tasks/new" => "tasks#create"
  get "categories/:id/tasks" => "tasks#show"
  get "categories/:id/tasks/new" => "tasks#new"

  resources :tasks
  resources :categories

  root 'landing#index'
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
