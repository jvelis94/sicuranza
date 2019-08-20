Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :work_orders do 
    resources :invoices
  end

  resources :invoices, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
