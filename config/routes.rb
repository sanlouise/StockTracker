Rails.application.routes.draw do
  
  devise_for :users
  get 'welcome', to: 'welcome#index'
  root 'welcome#index'

  get 'my_portfolio', to: "users#my_portfolio"
end
