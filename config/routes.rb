NerdyBook::Application.routes.draw do
  match 'facebooks/index'
  match 'facebooks/logout'
  match 'facebooks/canvas', :via => :post
  match 'facebooks/callback'

  root :to => "facebooks#index"
end
