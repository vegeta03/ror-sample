Rails.application.routes.draw do
devise_for :users, :controllers => {sessions: "sessions"},
    :path_names => {:sign_in => 'login', :sign_out => 'logout'} # for changing the sign_in and soignout to login/out
  devise_scope :user do
    root to: 'home#index'
  end
  resources :dashboard
  resources :page1
  resources :page2
  resources :page3
  resources :page4
end
