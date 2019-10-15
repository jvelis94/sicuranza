Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do 
    authenticated :user do
      root 'pages#home', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
    
  get 'invoices/paid', to: 'invoices#paid', as: 'paid_invoices'
  get 'invoices/unpaid', to: 'invoices#unpaid', as: 'unpaid_invoices'
  get 'estimates', to: 'invoices#estimates', as: 'estimates'
  delete 'contractors/delete_file/:id', to: 'contractors#delete_file_attachment', as: 'delete_file'

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

  resources :tasks
  resources :tasks do
    member do
      patch :done
    end
  end

  resources :estimates_todos
  resources :estimates_todos do
    member do
      patch :done
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
