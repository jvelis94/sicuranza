Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pages, only: [:options]
  get 'work_orders/options', to: 'work_orders#options', as: 'work_order_options'
  get 'contractors/options', to: 'contractors#options', as: 'contractors_options'
  get 'invoices/paid', to: 'invoices#paid', as: 'paid_invoices'
  get 'invoices/unpaid', to: 'invoices#unpaid', as: 'unpaid_invoices'
  get 'estimates', to: 'invoices#estimates', as: 'estimates'
  delete 'contractors/:id/delete_file/:id', to: 'contractors#delete_file_attachment', as: 'delete_file'

  resources :work_orders do
    resources :invoices
  end

  resources :invoices, only: [:index, :show, :edit, :update]
  resources :contractors
  resources :visitors, only: [:index]
  resources :events
  resources :jobpunchlists do 
    resources :punchlistitems do
      member do
        patch :complete
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
