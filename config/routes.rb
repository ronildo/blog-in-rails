Blog::Application.routes.draw do
  resources :comments

  root :to => redirect("/posts")
  resources :posts do
  	resources :comments
  end
  devise_for :users
end
