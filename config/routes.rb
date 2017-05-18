Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:index, :show, :create, :new, :destroy] do
    resources :doses, only: [:destroy, :create, :new]
  end

  root 'cocktails#index'

end
