Tajbrno::Application.routes.draw do
  root 'articles#index'

  # routes that are concerned with access
  get  '/login',  to: 'access#login'
  post '/login',  to: 'access#attempt_login'
  get  '/logout', to: 'access#logout'
  get  '/denied', to: 'access#denied'

  # routes that are concerned with users
  get   '/user/signup',  to: 'users#signup'
  post  '/user/signup',  to: 'users#create'
  get   '/user/options', to: 'users#options'
  patch '/user',         to: 'users#update'

  # routes that are concerned with articles
  get    '/articles',               to: 'articles#index'
  get    '/articles/new',           to: 'articles#new',   as: :new_article
  post   '/articles',               to: 'articles#create'
  get    '/articles/show/:id',      to: 'articles#show',  as: :show_article
  get    '/articles/show/:id/edit', to: 'articles#edit',  as: :edit_article
  patch  '/articles',               to: 'articles#update'
  delete '/articles/show/:id',      to: 'articles#destroy', as: :delete_article
  get    '/contacts',               to: 'articles#contacts'

  # routes that are concerned with menus
  get    '/menu',                         to: 'categories#index'
  get    '/menu/categories/new',          to: 'categories#new'
  post   '/menu/categories',              to: 'categories#create'
  get    '/menu/categories/:id/dishes',   to: 'categories#show_dishes'
  get    '/menu/categories/:id/add_dish', to: 'categories#add_dish'
  patch  '/menu/categories/:id',          to: 'categories#update_dishes'
  get    '/menu/categories/:id/edit',     to: 'categories#edit'
  patch  '/menu/categories',              to: 'categories#update'
  delete '/menu/categories/:id',          to: 'categories#destroy', as: :delete_category

  delete '/menu/categories/:category_id/remove/:dish_id',
         to: 'categories#destroy_dish_assoc',
         as: :delete_dish_assoc

  get    '/menu/dishes',               to: 'dishes#index'
  get    '/menu/dishes/new',           to: 'dishes#new'
  post   '/menu/dishes',               to: 'dishes#create'
  get    '/menu/dishes/show/:id',      to: 'dishes#show'
  get    '/menu/dishse/show/:id/edit', to: 'dishes#edit'
  patch  '/menu/dishes',               to: 'dishes#update'
  delete '/menu/dishes/show/:id',      to: 'dishes#destroy', as: :delete_dish

  # routes that are concerned with reservations
  get    '/reservations',           to: 'reservations#index'
  get    '/reservations/new',       to: 'reservations#new'
  post   '/reservations',           to: 'reservations#create'
  post   '/reservations/:id/allow', to: 'reservations#allow'
  delete '/reservations/:id',       to: 'reservations#destroy', as: :delete_reservation

  # routes that are concerned with gallery
  get    '/gallery',               to: 'gallery#index'
  get    '/gallery/new',           to: 'gallery#new'
  post   '/gallery',               to: 'gallery#create'
  get    '/gallery/show/:id',      to: 'gallery#show'
  get    '/gallery/show/:id/edit', to: 'gallery#edit'
  patch  '/gallery',               to: 'gallery#update'
  delete '/gallery/show/:id',      to: 'gallery#destroy', as: :delete_gallery_image
end
