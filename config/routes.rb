Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :blogs
    resources :posts
  end

  resources :blogs, only: [:show] do
    get "/tagged/:tag" => "blogs#tag", :as => :tag
    get "/:id" => "posts#show", :as => :post
  end
end
