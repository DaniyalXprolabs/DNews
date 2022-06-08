Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users, :controllers =>{:registrations => "registrations"}
  get 'pages/index'
  root to: 'posts#index'
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    resources :posts do
      collection do
        get 'hobby'
        get 'study'
        get 'team'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
