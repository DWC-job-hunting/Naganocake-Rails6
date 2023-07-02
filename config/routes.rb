Rails.application.routes.draw do
  # namespace :admin do
  #   get 'products/index'
  #   get 'products/show'
  #   get 'products/new'
  #   get 'products/edit'
  #   get 'products/create'
  #   get 'products/update'
  # end
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    root to: 'homes#top'
    resources :customers
    resources :products
    resources :genres
  end
  root to: 'public/homes#top'
  namespace :public do
    get 'customers/confirm_withdraw'
    patch 'customers/withdraw'
    get 'cart_items/delete_all'
    resources :customers, only: [:show, :edit, :update]
    resources :products, only: [:index, :show]
    resources :cart_items
    # get 'customers/show'
    # get 'customers/edit'
    # get 'customers/update'

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
