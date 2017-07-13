Rails.application.routes.draw do
  scope "(:locale)", :locale => /es|en/ do
    mount Ckeditor::Engine => '/ckeditor'
    devise_for :admins

    root 'posts#index'
    resources :posts
    resources :tags, only: [:index, :show]

    get '*path' => redirect('/')
  end
end
