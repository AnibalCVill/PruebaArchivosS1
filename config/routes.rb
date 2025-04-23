Rails.application.routes.draw do
  devise_for :users

  resource :profile, only: [:show, :edit, :update]

  get 'render/index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # DEFAULT ROUTE
  root "render#index"


  ###################
  # LÓGICA DE RUTAS #
  ###################
  # -> Artículos (Objeto)
  post "/articles", to: "articles#create"
  patch "/articles/:article_id", to: "articles#update"

  # -> Blogs (Objeto)
  post "/blogs", to: "blogs#create"
  patch "/blogs/:blog_id", to: "blogs#update"
  delete "/blogs/:blog_id", to: "blogs#delete"





end
