Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :blogs
    resources :posts
  end

  resources :blogs, only: [:index, :show] do
      get '/:id' => 'posts#show', as: :post_in_blog
      resources :posts, only: [:index, :show]
  end
end
