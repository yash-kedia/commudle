Rails.application.routes.draw do



  resources :events, only: [:index, :new, :create, :edit, :update, :show] do
    member do
      post 'assign_form', as: 'assign_data_form'
    end
  end


  resources :data_forms, only: [:index, :new, :create, :edit, :update]

  match '*all', to: proc { [204, {}, ['']] }, via: :options

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  root "application#hello_gdg"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
