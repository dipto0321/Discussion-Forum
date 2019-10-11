Rails.application.routes.draw do
  resources :channels
  resources :discussions do
    resources :replies
  end
  
  devise_scope :user do
    authenticated :user do
      root 'discussions#new'
    end

    unauthenticated do
      root 'devise/sessions#new'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
