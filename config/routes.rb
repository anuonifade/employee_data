Rails.application.routes.draw do
  root 'employers#index'
  get 'edit/:id', to: 'employers#edit'

  get 'earnings/:id', to: 'earnings#index'
  post 'earnings/upload/:id', to: 'earnings#upload'
  get 'earnings/show/:id', to: 'earnings#show', as: 'show_all_earnings'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
