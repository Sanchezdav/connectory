Rails.application.routes.draw do
  devise_for :users

  unauthenticated :user do
    devise_scope :user do
      root 'home#index', as: :unauthenticated_root
    end
  end
  
  authenticated :user do
    root 'posts#index', as: :authenticated_root
    resources :posts
  end

end
