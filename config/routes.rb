Blog::Application.routes.draw do
  root :to => redirect("/posts")
  resources :posts
  devise_for :users
end
