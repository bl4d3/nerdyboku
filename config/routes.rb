NerdyBook::Application.routes.draw do
  match 'facebooks/index', :via => :post
  match 'facebooks/logout'
  match 'facebooks/canvas'
  match 'facebooks/callback'

  root :to => "facebooks#index"
end
